import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Helper/widgets.dart';
import 'package:naruto_the_ninja_way/Models/character.dart';
import 'package:naruto_the_ninja_way/Providers/listOfCharacters.dart';

class charcterDetailScreen extends StatefulWidget {
  final int indexOfCharacter;

  charcterDetailScreen({this.indexOfCharacter});

  @override
  _charcterDetailScreenState createState() => _charcterDetailScreenState();
}

class _charcterDetailScreenState extends State<charcterDetailScreen> {
  int currentCategory = 0;
  final myDivider = Opacity(
    opacity: 0.0,
    child: Divider(
      height: 6,
    ),
  );
  final List<String> categories = [
    'Details',
    'Ninja Way',
    'Missions',
    'About',
  ];

  displayMenu(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentCategory = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: (currentCategory == index)
                    ? [
                        Colors.red[200],
                        Colors.red[300],
                        Colors.red[400],
                      ]
                    : [
                        Colors.transparent,
                        Colors.transparent,
                      ],
              )),
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 10.0, bottom: 10, right: 16, left: 16),
              child: Text(
                categories[index],
                style: TextStyle(
                    fontSize: displayWidth(context) * 0.036,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final character c =
        listOfCharacters().allCharacters[widget.indexOfCharacter];
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/villages/leaf.jpg'),
            fit: BoxFit.fill,
          ),
             // border: Border.all(color: Colors.black54,width: displayWidth(context)*0.03),
        ),
        child: ClipRRect(
          // make sure we apply clip it properly
          child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: Container(
        height: displayHeight(context),
          width: displayWidth(context),
          alignment: Alignment.center,
          color: Colors.black54.withOpacity(0.5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
            top: displayHeight(context) * 0.04,
        left: displayWidth(context) * 0.02,
        child: IconButton(
          iconSize: displayWidth(context) * 0.09,
          icon: Icon(Ionicons.arrow_back_circle),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
            )
            ),
          ],
        ),
    ),
    ),
        ),
      ),
    );
  }
}
