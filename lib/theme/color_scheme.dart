import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.light(
  primary: Colors.blue,
  onPrimary: Colors.white,
  secondary: Colors.orange,
  onSecondary: Colors.white,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Colors.red,
  onError: Colors.white,
);

final darkColorScheme = ColorScheme.dark(
  primary: Colors.blue.shade200,
  onPrimary: Colors.black,
  secondary: Colors.orange.shade200,
  onSecondary: Colors.black,
  surface: Colors.grey.shade900,
  onSurface: Colors.white,
  error: Colors.red.shade400,
  onError: Colors.black,
);
