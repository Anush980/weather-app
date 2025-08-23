import 'package:flutter/material.dart';


final ColorScheme lightColorScheme = ColorScheme.light(
  primary: Color(0xFF2196F3),     
  onPrimary: Colors.white,        
  secondary: Color(0xFFFF9800),   
  onSecondary: Colors.white,
  surface: Colors.white,          
  onSurface: Colors.black,        
  background: Color(0xFFE3F2FD),  
  error: Color(0xFFD32F2F),
  onError: Colors.white,
);


final ColorScheme darkColorScheme = ColorScheme.dark(
  primary: Color(0xFF64B5F6),     
  onPrimary: Colors.black,
  secondary: Color(0xFFFFB74D),  
  onSecondary: Colors.black,
  surface: Color(0xFF121212),    
  onSurface: Colors.white,
  background: Color(0xFF0D47A1), 
  error: Color(0xFFEF5350),
  onError: Colors.black,
);
