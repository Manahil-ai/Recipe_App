import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home_page.dart';
import 'package:recipe_app/pages/loginpage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromARGB(255, 34, 174, 255),
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      ),
      initialRoute: "/login",
      routes: {
        "/login" : (context) => LoginPage(),
        "/home" : (context) => HomePage(),
      },
    );
  }
}