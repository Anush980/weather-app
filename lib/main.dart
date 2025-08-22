import 'package:flutter/material.dart';

void main() {
  runApp(const HomeUI());
}

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          backgroundColor: const Color.fromARGB(255, 234, 76, 65),
        ),
        body: Center(child: const Text("hello weather")),
      ),
    );
  }
}
