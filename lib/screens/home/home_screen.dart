import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
body: SafeArea(child: SingleChildScrollView(
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 18),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  hintText: "Search City",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none
                  )       ),
              ),
            ),
            SizedBox(width: 15,),
            Icon(Icons.add_a_photo_rounded)
          ],
        ),
      )
         ],
  ),
)),
    );
  }
}