import 'package:document_appmobile/src/bussiness/auth/bloc/auth_bloc.dart';
import 'package:document_appmobile/src/bussiness/theme/bloc/theme_bloc.dart';
import 'package:document_appmobile/src/data/repository/auth/login_repository.dart';
import 'package:document_appmobile/src/screen/home/home_screen.dart';
import 'package:document_appmobile/src/screen/login/login_screen.dart';
import 'package:document_appmobile/src/screen/splash/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  initScreen = sharedPreferences.getInt('initScreen');
  await sharedPreferences.setInt("initScreen", 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LoginRepository(),
      child: BlocProvider<AuthBloc>(
          lazy: false,
          create: (context) => AuthBloc(
                loginRepository: context.read<LoginRepository>(),
              ),
          child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
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
              // theme: state.theme,
              home: const HomeScreen(),
              initialRoute:
                  initScreen == 0 || initScreen == null ? 'onboard' : 'home',
              routes: {
                "home": (context) => const HomeScreen(),
                "onboard": (context) => const OnboardingPage()
              },
            );
          })),
    );
  }
}
