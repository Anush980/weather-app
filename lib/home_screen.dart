import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_button.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface, // dynamic background
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              "Explore the Weather Around You",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              "assets/loader.png",
              width: 230,
              height: 230,
            ),
            const SizedBox(height: 125),
            Text("Stay Ahead of the Weather, Wherever You Go",
            style:TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSurface
            )),
            SizedBox(height: 20,),
            CustomButton(label: "Get Started", onPressed: ()=>{})
          ],
        ),
      ),
    );
  }
}
