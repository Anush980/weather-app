import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    // Determine if dark mode is active
    bool isDark = themeProvider.themeMode == ThemeMode.system
        ? MediaQuery.of(context).platformBrightness == Brightness.dark
        : themeProvider.isDarkMode;

    return IconButton(
      icon: Icon(isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
      onPressed: () {
        themeProvider.toggleTheme(!isDark);
      },
    );
  }
}
