import 'package:flutter/material.dart';
import 'Screens/home.dart';

void main() {
  runApp(MyApp());
}

// create MyApp class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //  themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}
