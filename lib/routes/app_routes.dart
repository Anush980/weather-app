import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/screens/onboarding/onboarding.dart';

class AppRoutes {
  static const String onboarding = "/onboarding";
  static const String home = "/home";

  static Map<String, WidgetBuilder> routes = {
    onboarding: (context) => const Onboarding(),
    home: (context) => const HomeScreen(),
  };
}
