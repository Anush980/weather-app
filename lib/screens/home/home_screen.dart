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
    double screenWidth = MediaQuery.of(context).size.width;

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
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
              ),

              SizedBox(
                width: 200,
                height: 200,
                child: RiveAnimation.asset(
                  'assets/animations/weather.riv',
                  fit: BoxFit.contain,
                ),
              ),

              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    // Humidity
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/humidity.png',
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "81%",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Humidity", style: TextStyle(fontSize: 12)),
                      ],
                    ),

                    // Wind
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/wind.png', width: 35, height: 35),
                        SizedBox(height: 5),
                        Text(
                          "18 km/h",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Wind", style: TextStyle(fontSize: 12)),
                      ],
                    ),

                    // Temperature
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/temperature1.png',
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "32.9°C",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Max Temp", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                width: screenWidth*0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
