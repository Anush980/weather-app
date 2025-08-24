import 'package:flutter/material.dart';
import 'package:weather_app/widgets/theme_toggle.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = true;
  @override
  Widget build(BuildContext context) {
    String location = "Damak";
    String country = "Nepal";
    double temperature = 32.6;
    String description = "Mostly Cloudy";
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 18,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search City",
                          hintStyle: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    ThemeToggleButton(),
                  ],
                ),
              ),
              Text(
                "$location, $country",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "$temperature°C",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(description,style: TextStyle(fontWeight: FontWeight.w200,fontSize: 12),),
             
               SizedBox(
                width:300,
                height:300,
                child: RiveAnimation.asset('assets/animations/weather.riv',fit: BoxFit.contain))
            ],
          ),
        ),
      ),
    );
  }
}
