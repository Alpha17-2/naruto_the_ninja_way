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
    final myTextStyle = TextStyle(
      color: Colors.indigo[800],
      fontSize: displayWidth(context) * 0.04,
      fontWeight: FontWeight.w700,
      fontFamily: 'Acme',
    );
    final RichText heightText = RichText(text: TextSpan(
      children: [
        TextSpan(text: "Height : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
        TextSpan(text: c.height,style: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold)),
      ]
    ));
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/villages/rain.jpg'),
            fit: BoxFit.cover,
          ),
          // border: Border.all(color: Colors.black54,width: displayWidth(context)*0.03),
        ),
        child: ClipRRect(
          // make sure we apply clip it properly
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              height: displayHeight(context),
              width: displayWidth(context),
              alignment: Alignment.center,
              // color: Colors.black54.withOpacity(0.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      bottom: displayHeight(context) * 0.3,
                      child: Container(
                        height: displayHeight(context) * 0.73,
                        width: displayWidth(context),
                        //color: Colors.red,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: displayHeight(context) * 0.68,
                            aspectRatio: 16 / 9,
                            viewportFraction: 2.5,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 2),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 600),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,

                            //onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: c.images.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Image.asset(i);
                              },
                            );
                          }).toList(),
                        ),
                      )),
                  Positioned(
                      top: displayHeight(context) * 0.04,
                      left: displayWidth(context) * 0.02,
                      child: IconButton(
                        iconSize: displayWidth(context) * 0.09,
                        icon: Icon(Ionicons.arrow_back_circle),
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      )),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                    padding: EdgeInsets.only(
                        left: 12, top: 15, right: 12, bottom: 12),
                    height: displayHeight(context) * 0.5,
                    width: displayWidth(context) * 0.98,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50.0)),
                      border: Border.all(
                          color: Color(0xfbDAA521),
                          width: displayWidth(context) * 0.025),
                    ),),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 12, top: 15, right: 12, bottom: 12),
                      height: displayHeight(context) * 0.5,
                      width: displayWidth(context) * 0.98,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50.0)),
                        border: Border.all(
                            color: Color(0xfbDAA521),
                            width: displayWidth(context) * 0.015),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/villages/leaf.png',
                                height: displayHeight(context) * 0.045,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                c.name,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: displayWidth(context) * 0.058,
                                    fontFamily: 'Naruto'),
                              ),
                              Image.asset(
                                'images/general/shuriken.png',
                                height: displayHeight(context) * 0.045,
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          Opacity(
                              opacity: 0.0,
                              child: Divider(
                                height: displayHeight(context) * 0.005,
                              )),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  c.village,
                                  style: myTextStyle,
                                ),
                                VerticalDivider(
                                  color: Colors.red[700],
                                  thickness: displayWidth(context) * 0.003,
                                ),
                                Text(
                                  c.sex,
                                  style: myTextStyle,
                                ),
                                VerticalDivider(
                                  color: Colors.red[700],
                                  thickness: displayWidth(context) * 0.003,
                                ),
                                Text(
                                  c.rank,
                                  style: myTextStyle,
                                ),
                                VerticalDivider(
                                  thickness: displayWidth(context) * 0.003,
                                  color: Colors.red[700],
                                ),
                                Text(
                                  c.clan,
                                  style: myTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.red[700],
                            thickness: displayWidth(context) * 0.0045,
                            indent: displayWidth(context) * 0.1,
                            endIndent: displayWidth(context) * 0.1,
                          ),
                          Container(
                            height: displayHeight(context) * 0.34,
                            width: displayWidth(context) * 0.84,
                            //color: Colors.red,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      heightText,
                                    ],
                                  ),
                                  Text(
                                    c.caseStudy,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        wordSpacing: 1.5),
                                  ),
                                ],

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: displayHeight(context) * 0.015,
                      right: displayWidth(context) * 0.07,
                      child: Image.asset(
                        'images/general/kunai2.png',
                        height: displayHeight(context) * 0.03,
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                      bottom: displayHeight(context) * 0.029,
                      right: displayWidth(context) * 0.035,
                      child: Image.asset(
                        'images/general/kunai3.png',
                        width: displayHeight(context) * 0.03,
                        fit: BoxFit.fill,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
