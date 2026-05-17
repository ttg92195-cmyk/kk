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
  WidgetsFlutterBinding.ensureInitialized();

  // Catch all Flutter framework errors
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint('=== Flutter Error ===');
    debugPrint(details.exceptionAsString());
    debugPrint(details.stack.toString());
  };

  // Catch all async errors
  runZonedGuarded< void>(() {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProvider()),
        ],
        child: const KumastreamApp(),
      ),
    );
  }, (error, stackTrace) {
    debugPrint('=== Async Error ===');
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  });
}

class KumastreamApp extends StatelessWidget {
  const KumastreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kumastream',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      builder: (context, widget) {
        // Wrap entire app in error boundary
        ErrorWidget.builder = (FlutterErrorDetails details) {
          return Material(
            color: AppColors.scaffoldBackground,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, color: AppColors.primary, size: 48),
                  const SizedBox(height: 16),
                  const Text(
                    'Something went wrong',
                    style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      details.exceptionAsString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        };
        return widget ?? const SizedBox.shrink();
      },
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const MainNavigation(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/movie-detail': (context) => const MovieDetailScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
