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
            height: displayHeight(context),
            width: displayWidth(context),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/general/bg.jpg'),
              fit: BoxFit.cover,
            )),
            child: ClipRRect(
              // make sure we apply clip it properly
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          top: displayHeight(context)*0.01,
                          child: Container(
                            height: displayHeight(context) * 0.1,
                            width: displayWidth(context) * 0.57,
                           // color: Colors.black87,
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
                        top: displayHeight(context) * 0.122,
                        child: Container(
                          decoration: BoxDecoration(
                            //color: Colors.black38,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          height: displayHeight(context) * 0.06,
                          width: displayWidth(context) * 0.98,
                          child: Padding(
                            padding: const EdgeInsets.only(left:12.0,right: 12.0,top: 2.0,bottom: 2.0),
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return displayMenu(index);
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: menu.length,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: displayHeight(context) * 0.2,
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
