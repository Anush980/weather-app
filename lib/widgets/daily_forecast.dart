import 'package:flutter/material.dart';

class daily_forecast extends StatelessWidget {
  const daily_forecast({
    super.key,
    required this.time,
    required this.feelTemp,
    required this.iconCode,
  });

  final String time;
  final String feelTemp;
  final String iconCode;

  @override
  Widget build(BuildContext context) {
    String iconUrl = "https://openweathermap.org/img/wn/$iconCode@2x.png";
    return Container(
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(child: Text(time, style: TextStyle(fontSize: 12))),
          Image.network(iconUrl, width: 50, height: 43, errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error, size: 20);
          }),
          Text(feelTemp, style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
