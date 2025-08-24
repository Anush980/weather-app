import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_button.dart';
import 'package:weather_app/routes/app_routes.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Column(
           
            children: [
              Padding(padding:const EdgeInsets.symmetric(horizontal:20,vertical:30),
           
              child:Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Explore the Weather\n"),
                    TextSpan(text: "Around You")
                  ],
                ),
                 textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth*0.07,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
              )
              
               
              ),),
              
              const Spacer(flex: 1,),
              Image.asset("assets/loader.png", width: screenHeight*0.35, height: screenHeight*0.35),
              const Spacer(flex: 3),
              Padding(padding:const EdgeInsets.symmetric(horizontal: 24)),
              Text(
                "Stay Ahead of the Weather, Wherever You Go",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              
          
            Padding(padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              child:CustomButton(label: "Get Started", onPressed: () {Navigator.pushReplacementNamed(context,AppRoutes.home);
              }))
            ],
          ),
        ),
      ),
    );
  }
}
