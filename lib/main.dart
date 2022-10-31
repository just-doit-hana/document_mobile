import 'dart:io';

import 'package:document_appmobile/app.dart';
import 'package:document_appmobile/app/helper/shared_preference.dart';
import 'package:document_appmobile/src/bussiness/theme/bloc/theme_bloc.dart';
import 'package:document_appmobile/src/screen/splash/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/util/dio/dio_client.dart';
import 'src/data/repository/folder/folder_repo.dart';
import 'src/screen/files/myfile_screen.dart';

// int? initScreen;
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SharedPreferenceHelper.init();
//   initScreen = SharedPreferenceHelper.instance.getInt('initScreen');
//   SharedPreferenceHelper.instance.setInt('initScreen', 1);

//   // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   // initScreen = sharedPreferences.getInt('initScreen');
//   // await sharedPreferences.setInt("initScreen", 1);
//   HttpOverrides.global = MyHttpOverrides();

//   runApp(MyApp());
// }

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   final DioClient dioClient = DioClient();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ThemeBloc>(
//         create: (context) => ThemeBloc(),
//         child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
//           return MaterialApp(
//             localizationsDelegates: const [
//               AppLocalizations.delegate,
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate
//             ],
//             supportedLocales: const [Locale('en', ''), Locale('vi', '')],
//             title: 'Document Mobile',
//             debugShowCheckedModeBanner: false,
//             // theme: state.theme,
//             home: App(dioClient: dioClient),
//             initialRoute:
//                 initScreen == 0 || initScreen == null ? 'onboard' : 'home',
//             routes: {
//               "home": (context) => App(
//                     dioClient: dioClient,
//                   ),
//               "onboard": (context) => const OnboardingPage()
//             },
//           );
//         }));
//   }
// }

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
    return RepositoryProvider(
        create: (context) => FolderRepository(),
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [Locale('en', ''), Locale('vi', '')],
          title: 'Document Mobile',
          debugShowCheckedModeBanner: false,
          // theme: state.theme,
          home: const MyfileScreen(),
          initialRoute:
              initScreen == 0 || initScreen == null ? 'onboard' : 'home',
          routes: {
            "home": (context) => MyfileScreen(),
            "onboard": (context) => const OnboardingPage()
          },
        ));
    // BlocProvider<ThemeBloc>(
    //     create: (context) => ThemeBloc(),
    //     child: BlocBuilder<ThemeBloc, ThemeSate>(builder: (context, state) {
    //       return MaterialApp(
    //         localizationsDelegates: const [
    //           AppLocalizations.delegate,
    //           GlobalMaterialLocalizations.delegate,
    //           GlobalWidgetsLocalizations.delegate,
    //           GlobalCupertinoLocalizations.delegate
    //         ],
    //         supportedLocales: const [Locale('en', ''), Locale('vi', '')],
    //         title: 'Document Mobile',
    //         debugShowCheckedModeBanner: false,
    //         // theme: state.theme,
    //         home: App(dioClient: dioClient),
    //         initialRoute:
    //             initScreen == 0 || initScreen == null ? 'onboard' : 'home',
    //         routes: {
    //           "home": (context) => App(
    //                 dioClient: dioClient,
    //               ),
    //           "onboard": (context) => const OnboardingPage()
    //         },
    //       );
    //     }));
  }
}
