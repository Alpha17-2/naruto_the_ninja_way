import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Models/character.dart';
import 'package:naruto_the_ninja_way/Providers/listOfCharacters.dart';

class charcterDetailScreen extends StatefulWidget {
  final int indexOfCharacter;

  charcterDetailScreen({this.indexOfCharacter});

  @override
  _charcterDetailScreenState createState() => _charcterDetailScreenState();
}

class _charcterDetailScreenState extends State<charcterDetailScreen> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    final character c =
        listOfCharacters().allCharacters[widget.indexOfCharacter];
    final String name = c.name;
    final String village = c.village;
    final String sex = c.sex;
    final String clan = c.clan;
    final String rank = c.rank;
    final String villageSymbol = c.villageSymbol;
    final String age = c.age;
    final String firstAppearance = c.firstAppearance;
    final String quote = c.quote;
    final String signatureMove = c.signatureMove;
    final String caseStudy = c.caseStudy;
    final List<String> images = c.images;
    final String noticeableFeature = c.noticeableFeature;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfb434343),
                Color(0xfb000000),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: displayHeight(context) * 0.04,
                  left: displayWidth(context) * 0.02,
                  child: IconButton(
                    iconSize: displayWidth(context) * 0.09,
                    icon: Icon(Ionicons.arrow_back_circle),
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: displayHeight(context) * 0.65,
                    width: displayWidth(context),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        )),
                  )),
              Positioned(
                  top: displayHeight(context) * 0.15 + kToolbarHeight,
                  left: displayWidth(context) * 0.02,
                  child: GestureDetector(
                    onTap: () {
                      if (currentImage - 1 >= 0)
                        setState(() {
                          currentImage--;
                        });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color:
                          (currentImage - 1 >= 0) ? Colors.indigo : Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back,
                          size: displayWidth(context) * 0.05,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: displayHeight(context) * 0.15 + kToolbarHeight,
                  right: displayWidth(context) * 0.02,
                  child: GestureDetector(
                    onTap: () {
                      if (currentImage + 1 < c.images.length)
                        setState(() {
                          ++currentImage;
                        });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: (currentImage + 1 < c.images.length)
                          ? Colors.indigo
                          : Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward,
                          size: displayWidth(context) * 0.05,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                top: displayHeight(context) * 0.03 + kToolbarHeight,
                child: Image.asset(
                  c.images[currentImage],
                  height: displayHeight(context) * 0.38,
                  //width: displayWidth(context)*0.4,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
