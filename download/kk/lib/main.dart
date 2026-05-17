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

  // Global error handler to prevent crashes
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint('=== Flutter Error ===');
    debugPrint(details.exceptionAsString());
    debugPrint(details.stack.toString());
  };

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: const KumastreamApp(),
    ),
  );
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
        // Global error boundary
        ErrorWidget.builder = (FlutterErrorDetails details) {
          return Material(
            color: AppColors.scaffoldBackground,
            child: Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(color: AppColors.textSecondary),
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
