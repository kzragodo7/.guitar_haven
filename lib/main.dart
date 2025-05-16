import 'package:flutter/material.dart';
import 'view/splash/splash_screen.dart';
import 'utils/constants.dart'; // Import your colors

void main() {
  runApp(const GuitarHavenApp());
}

class GuitarHavenApp extends StatelessWidget {
  const GuitarHavenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guitar Haven',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 230, 169, 151),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppConstantsColor.lightBrown,
          selectedItemColor: const Color.fromARGB(255, 255, 172, 146),
          unselectedItemColor: const Color.fromARGB(255, 255, 178, 152),
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color.fromARGB(255, 179, 104, 82),
          displayColor: const Color.fromARGB(255, 153, 112, 93),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
