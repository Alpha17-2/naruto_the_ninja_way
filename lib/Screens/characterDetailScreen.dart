import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Models/character.dart';
import 'package:naruto_the_ninja_way/Providers/listOfCharacters.dart';
class charcterDetailScreen extends StatelessWidget {
  final int indexOfCharacter;
  final List<List<Color>> gradientColors = [
    [
      Color(0xfb000428),
      Color(0xfb004e92),
    ],
    [
      Color(0xfb43cea2),
      Color(0xfb185a9d),
    ],
    [
      Color(0xfbec6f66),
      Color(0xfbf3a183)
    ],
    [
      Color(0xfb141E30),
      Color(0xfb243B55),
    ],
    [
      Color(0xfb6441A5),
      Color(0xfb2a0845),
    ]

  ];
  Random random = Random();


  charcterDetailScreen({this.indexOfCharacter});
  @override
  Widget build(BuildContext context) {
    int randomIndex = random.nextInt(gradientColors.length);
    final character c = listOfCharacters().allCharacters[indexOfCharacter];
    final String name=c.name;
    final String village = c.village;
    final String sex=c.sex;
    final String clan=c.clan;
    final String rank=c.rank;
    final String villageSymbol=c.villageSymbol;
    final String age=c.age;
    final String firstAppearance=c.firstAppearance;
    final String quote=c.quote;
    final String signatureMove=c.signatureMove;
    final String caseStudy=c.caseStudy;
    final List<String> images=c.images;
    final String noticeableFeature=c.noticeableFeature;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors[randomIndex],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: displayHeight(context)*0.01+kToolbarHeight,
                  left: displayWidth(context)*0.04,
                  child: IconButton(
                    iconSize: displayWidth(context)*0.09,
                icon: Icon(Ionicons.arrow_back_circle),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
