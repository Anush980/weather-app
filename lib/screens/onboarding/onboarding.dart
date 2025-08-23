import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.surface, // dynamic background
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Explore the Weather\n"),
                  TextSpan(text: "Around You")
                ],
              ),
               textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
            )
            
             
              ),
            
            const SizedBox(height: 20),
            Image.asset("assets/loader.png", width: screenHeight*0.3, height: screenHeight*0.3),
            const SizedBox(height: 125),
            Text(
              "Stay Ahead of the Weather, Wherever You Go",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(label: "Get Started", onPressed: () => {}),
          ],
        ),
      ),
    );
  }
}
