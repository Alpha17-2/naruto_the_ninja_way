import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/home.dart';


void main(){
  runApp(MyApp());
}

// create MyApp class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

      ],
      child: MaterialApp(
        home: home(),
      ),
    );
  }
}


