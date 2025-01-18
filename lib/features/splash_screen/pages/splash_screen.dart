import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_monitoring_app/core/utils/image_constant.dart';
import 'package:vehicle_monitoring_app/core/utils/theme.dart';
import 'package:vehicle_monitoring_app/features/splash_screen/pages/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isNew = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AppImages.logo,
      nextScreen: IntroScreen(),
      backgroundColor: AppColors.primary,
      duration: 3000,
    );
  }
}
