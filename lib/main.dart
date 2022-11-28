import 'dart:io';

import 'package:document_mobile/src/data/repository/account/account_repository.dart';
import 'package:document_mobile/src/data/repository/auth/login_repository.dart';
import 'package:document_mobile/src/data/repository/file/file_repository.dart';
import 'package:document_mobile/src/data/repository/quota/quota_repo.dart';
import 'package:document_mobile/src/data/repository/version/vesion_repo.dart';
import 'package:document_mobile/src/screen/shared/share_file_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'app.dart';
import 'app/helper/shared_preference.dart';
import 'app/util/dio/dio_client.dart';
import 'src/bussiness/folder/bloc/folder_bloc.dart';
import 'src/bussiness/theme/bloc/theme_bloc.dart';
import 'src/data/repository/folder/folder_repo.dart';
import 'src/screen/archive/archived_screen.dart';
import 'src/screen/home/home_folder.dart';
import 'src/screen/recylebin/recyclebin_screen.dart';
import 'src/screen/splash/onboarding_page.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  initScreen = SharedPreferenceHelper.instance.getInt('initScreen');
  SharedPreferenceHelper.instance.setInt('initScreen', 1);

  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // initScreen = sharedPreferences.getInt('initScreen');
  // await sharedPreferences.setInt("initScreen", 1);
  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final DioClient dioClient = DioClient();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => QuotaRepository()),
          RepositoryProvider(create: (_) => LoginRepository()),
          RepositoryProvider(create: (_) => FileRepository()),
          RepositoryProvider(create: (_) => FolderRepository()),
          RepositoryProvider(create: (_) => AccountRepository()),
          RepositoryProvider(create: (_) => VersionRepository())
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: ((context) => ThemeBloc())),
            BlocProvider(
                create: ((context) =>
                    FolderBloc(context.read<FolderRepository>())
                      ..add(LoadFolderRecycleBinEvent())),
                child: const RecyclebinScreen()),
            BlocProvider(
                child: const AchiveFileScreen(),
                create: (context) =>
                    FolderBloc(context.read<FolderRepository>())
                      ..add(LoadFolderBackupEvent())),
            BlocProvider(
                child: const HomeFolder(),
                create: (context) =>
                    FolderBloc(context.read<FolderRepository>())
                      ..add(LoadFolderPrivateEvent())),
            BlocProvider(
                child: const HomeFolder(),
                create: (context) =>
                    FolderBloc(context.read<FolderRepository>())
                      ..add(LoadFolderPublicEvent())),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [Locale('en', ''), Locale('vi', '')],
                title: 'Document Mobile',
                debugShowCheckedModeBanner: false,
                theme: state.theme,
                home: const App(),
                initialRoute:
                    initScreen == 0 || initScreen == null ? 'onboard' : 'home',
                routes: {
                  "home": (context) => const App(),
                  "onboard": (context) => const OnboardingPage(),
                  "homeFolder": (context) => const HomeFolder(),
                  'recycleBin': ((context) => const RecyclebinScreen()),
                  'sharefile': ((context) => const ShareFileScreen())
                },
              );
            },
          ),
        ));
    // );
  }
}
