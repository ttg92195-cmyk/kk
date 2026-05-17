import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'screens/splash_screen.dart';
import 'screens/main_navigation.dart';
import 'screens/movie_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/auth/signin_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'providers/app_provider.dart';

void main() {
  // Ensure Flutter binding is initialized first
  WidgetsFlutterBinding.ensureInitialized();

  // Catch errors in Flutter framework
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  // Catch all async errors
  runZonedGuarded< void>(() {
    runApp(const KumastreamApp());
  }, (error, stackTrace) {
    debugPrint('Unhandled error: $error');
  });
}

class KumastreamApp extends StatelessWidget {
  const KumastreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        title: 'Kumastream',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const MainNavigation(),
          '/signin': (context) => const SignInScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/movie-detail': (context) => const MovieDetailScreen(),
          '/settings': (context) => const SettingsScreen(),
        },
      ),
    );
  }
}
