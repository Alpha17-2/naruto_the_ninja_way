import 'package:flutter/material.dart';
import 'package:naruto_the_ninja_way/Providers/listOfCharacters.dart';
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
        ChangeNotifierProvider(create: (context)=>listOfCharacters()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home(),
      ),
    );
  }
}


