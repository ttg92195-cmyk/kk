import 'package:flutter/material.dart';
import '../config/theme.dart';

/// Splash screen - simple and crash-proof.
/// Automatically navigates to /home after 2 seconds.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    try {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200),
      );
      _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
      _controller.forward();
    } catch (e) {
      debugPrint('Splash animation error: $e');
    }
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    try {
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      debugPrint('Navigation error: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.movie_filter_rounded,
                size: 48,
                color: AppColors.scaffoldBackground,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Kumastream',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Stream Anytime, Anywhere',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: 120,
              child: LinearProgressIndicator(
                backgroundColor: AppColors.surface,
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
