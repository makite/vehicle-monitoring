import 'package:flutter/material.dart';
import 'package:vehicle_monitoring_app/features/dashboard/presentation/pages/dashbaord.dart';
import 'package:vehicle_monitoring_app/features/splash_screen/pages/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String homePage = '/home';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => VehicleDashboard(),
  };
}
