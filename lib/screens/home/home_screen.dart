import 'package:flutter/material.dart';
import 'package:weather_app/widgets/daily_forecast.dart';
import 'package:weather_app/widgets/theme_toggle.dart';
import 'package:weather_app/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = true;
  final WeatherService weatherService = WeatherService();
  final TextEditingController _cityController = TextEditingController();
  bool cityNotFound = false;
  Map<String, dynamic>? weatherData;
  List<dynamic>? forecastData;

  @override
  void initState() {
    super.initState();
    fetchWeather("Biratnagar");
  }

void fetchWeather(String city) async {
  try {
    final data = await weatherService.getWeather(city);
    final forecast = await weatherService.getForecast(city);

    setState(() {
      weatherData = data;
      forecastData = forecast;
      cityNotFound = false;
    });
  } catch (e) {
    print(e);

    setState(() {
      cityNotFound = true; // border turns red
    });

    // Show Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("City '$city' not found"),
        backgroundColor: const Color.fromARGB(255, 241, 139, 6),
        duration: Duration(seconds: 3),
      ),
    );

   
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        cityNotFound = false;
      });
    });
  }
}



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    String location = weatherData?["name"] ?? "Loading...";
    String country = weatherData?["sys"]["country"] ?? "";
    double temperature = weatherData?["main"]["temp"]?.toDouble() ?? 0.0;
    String description = weatherData?["weather"][0]["description"] ?? "";
    String humidity = "${weatherData?["main"]["humidity"] ?? "--"}%";
    String wind = "${weatherData?["wind"]["speed"] ?? "--"} km/h";
    String maxTemp = "${weatherData?["main"]["temp_max"] ?? "--"}°C";
    String iconCode = weatherData?["weather"][0]["icon"] ?? "01d";
    String iconUrl = "https://openweathermap.org/img/wn/$iconCode@4x.png";

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Search bar + theme toggle
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 18,
                ),
                child: Row(
                  children: [
                    Expanded(
  child: TextField(
    controller: _cityController,
    decoration: InputDecoration(
      hintText: "Search City",
      hintStyle: TextStyle(color: Theme.of(context).hintColor),
      // prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: cityNotFound ? Colors.red : Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: cityNotFound ? Colors.red : Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: cityNotFound ? Colors.red : Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
    ),
    onSubmitted: (value) {
      if (value.isNotEmpty) {
        fetchWeather(value);
      }
    },
  ),
),
IconButton(
  icon: Icon(Icons.search),
  onPressed: () {
    final city = _cityController.text;
    if (city.isNotEmpty) {
      fetchWeather(city);
    }
  },
),


                    SizedBox(width: 15),
                    ThemeToggleButton(),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Location and temperature
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
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
              ),

              // Weather image
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(
                  iconUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, size: 50); // fallback icon
                  },
                ),
              ),

              // Weather details (humidity, wind, max temp)
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
                          humidity,
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
                          wind,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Wind", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    // Max Temp
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
                          maxTemp,
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

              // Forecast header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today forecast",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Weekly Forecast",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 110,
                child: forecastData == null
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: forecastData!.length,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (context, index) {
                          final item = forecastData![index];
                          final dt = DateTime.fromMillisecondsSinceEpoch(
                            item["dt"] * 1000,
                          );
                          final temp = item["main"]["feels_like"]
                              .toStringAsFixed(1);
                          final hour = dt.hour;
                          final timeString = hour > 12
                              ? "${hour - 12} PM"
                              : "$hour AM";
                          final iconCode = item["weather"][0]["icon"];

                          return daily_forecast(
                            time: timeString,
                            feelTemp: "$temp°C",
                            iconCode: iconCode,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
