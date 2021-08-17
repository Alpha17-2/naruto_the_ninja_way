import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Screens/characterScreen.dart';
import 'package:naruto_the_ninja_way/Screens/clanScreen.dart';
import 'package:naruto_the_ninja_way/Screens/ninjaGearScreen.dart';
import 'package:naruto_the_ninja_way/Screens/rankScreen.dart';
import 'akatsukiScreen.dart';
import 'jinchurikiScreen.dart';
import 'jutsuScreen.dart';
import 'spiritScreen.dart';
import 'summoningScreen.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int currentMenu = 0;
  final List<String> menu = [
    'Characters',
    'Clans',
    'Ranks',
    'Ninja Gears',
    'Jutsu',
    'Akatsuki',
    'Jinchuriki',
    'Spirits',
    'Summonings',
  ];
  final List<dynamic> screens = [
    characterScreen(),
    clanScreeen(),
    rankScreen(),
    ninjaGearScreen(),
    jutsuScreen(),
    akatsukiScreen(),
    jinchurikiScreen(),
    spiritScreen(),
    summoningScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget displayMenu(int index) {
      return Padding(
        padding: const EdgeInsets.only(right: 6.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentMenu = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: (currentMenu == index)
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
                  menu[index],
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

    return Scaffold(
      body: SafeArea(
          top: true,
          child: Container(
            height: displayHeight(context) - kToolbarHeight,
            width: displayWidth(context),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/general/bg.jpg'),
              fit: BoxFit.cover,
            )),
            child: ClipRRect(
              // make sure we apply clip it properly
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          top: 0,
                          child: Container(
                            height: displayHeight(context) * 0.18,
                            width: displayWidth(context) * 0.57,
                            //color: Colors.black87,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/general/heading.png',
                                  height: displayHeight(context) * 0.05,
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'images/general/subHeading.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                        top: displayHeight(context) * 0.1775,
                        child: Container(
                          height: displayHeight(context) * 0.05,
                          width: displayWidth(context) * 0.95,
                          //color: Colors.white,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return displayMenu(index);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: menu.length,
                          ),
                        ),
                      ),
                      Positioned(
                        top: displayHeight(context) * 0.25,
                        child: screens[currentMenu],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
