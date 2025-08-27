import 'package:flutter/material.dart';

class daily_forecast extends StatelessWidget {
  const daily_forecast({super.key, required this.time, required this.feelTemp});

  final String time;
  final String feelTemp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, 
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(child: Text(time, style: TextStyle(fontSize: 12))),
          Image.asset("assets/raining.png", fit: BoxFit.contain, width: 40, height: 30),
          Text(feelTemp, style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
