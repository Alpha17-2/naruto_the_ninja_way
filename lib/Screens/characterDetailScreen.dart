import 'dart:ui';
import 'package:pie_chart/pie_chart.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  int currentCategory = 0;

  final myDivider = Opacity(
    opacity: 0.0,
    child: Divider(
      height: 6,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final character c =
        listOfCharacters().allCharacters[widget.indexOfCharacter];
    final bool isMissionDataAvailable = (c.drank != -1) ? true : false;
    final myTextStyle = TextStyle(
      color: Colors.indigo[800],
      fontSize: displayWidth(context) * 0.045,
      fontWeight: FontWeight.w700,
      fontFamily: 'Acme',
    );
    final RichText heightText = RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Height : ",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: displayWidth(context) * 0.043)),
      TextSpan(
          text: c.height,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: displayWidth(context) * 0.043)),
    ]));
    final RichText weightText = RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Weight : ",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: displayWidth(context) * 0.043)),
      TextSpan(
          text: c.weight,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: displayWidth(context) * 0.043)),
    ]));
    final RichText birthdayText = RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Birthday : ",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: displayWidth(context) * 0.043)),
      TextSpan(
          text: c.dob,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: displayWidth(context) * 0.043)),
    ]));
    final RichText SignatureMoveText = RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Siganture move : ",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: displayWidth(context) * 0.043)),
      TextSpan(
          text: c.signatureMove,
          style: TextStyle(
              color: Colors.teal[800],
              fontWeight: FontWeight.bold,
              //fontFamily: 'Naruto',
              fontSize: displayWidth(context) * 0.043)),
    ]));
    final RichText QuoteText = RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Qoute : ",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: displayWidth(context) * 0.043)),
      TextSpan(
          text: c.quote,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              //fontFamily: 'Naruto',
              fontSize: displayWidth(context) * 0.043)),
    ]));
    final RichText AgeText = RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Age : ",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: displayWidth(context) * 0.043)),
      TextSpan(
          text: c.age,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              //fontFamily: 'Naruto',
              fontSize: displayWidth(context) * 0.043)),
    ]));
    final RichText firstAppearanceText = RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "First Appearance : ",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: displayWidth(context) * 0.043)),
      TextSpan(
          text: c.firstAppearance,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              //fontFamily: 'Naruto',
              fontSize: displayWidth(context) * 0.04)),
    ]));
    final Map<String, double> missionMap = {
      'S': c.srank,
      'A': c.arank,
      'B': c.brank,
      'C': c.crank,
      'D': c.drank,
    };
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/general/cover.jpg'),
            fit: BoxFit.cover,
          ),
          // border: Border.all(color: Colors.black54,width: displayWidth(context)*0.03),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                bottom: displayHeight(context) * 0.3,
                child: Container(
                  height: displayHeight(context) * 0.7,
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
                      autoPlayAnimationDuration: Duration(milliseconds: 600),
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
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context),
                )),
            Positioned(
                top: displayHeight(context) * 0.05,
                right: displayWidth(context) * 0.04,
                child: Image.asset(
                  c.centerVillageSymbol,
                  height: displayHeight(context) * 0.06,
                  fit: BoxFit.fill,
                )),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    EdgeInsets.only(left: 12, top: 15, right: 12, bottom: 12),
                height: displayHeight(context) * 0.5,
                width: displayWidth(context) * 0.98,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50.0)),
                  border: Border.all(
                      color: Color(0xfbDAA521),
                      width: displayWidth(context) * 0.025),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    EdgeInsets.only(left: 12, top: 15, right: 12, bottom: 12),
                height: displayHeight(context) * 0.5,
                width: displayWidth(context) * 0.98,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50.0)),
                  border: Border.all(
                      color: Colors.black54,
                      width: displayWidth(context) * 0.015),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            c.villageSymbol,
                            width: displayWidth(context) * 0.18,
                            height: displayHeight(context) * 0.04,
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
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
                      height: displayHeight(context) * 0.03,
                      thickness: displayWidth(context) * 0.0045,
                      indent: displayWidth(context) * 0.1,
                      endIndent: displayWidth(context) * 0.1,
                    ),
                    Container(
                      height: displayHeight(context) * 0.342,
                      width: displayWidth(context) * 0.84,
                      //color: Colors.red,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                heightText,
                                weightText,
                              ],
                            ),
                            Opacity(
                                opacity: 0.0,
                                child: Divider(
                                  height: displayHeight(context) * 0.01,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AgeText,
                                birthdayText,
                              ],
                            ),
                            Opacity(
                                opacity: 0.0,
                                child: Divider(
                                  height: displayHeight(context) * 0.01,
                                )),
                            firstAppearanceText,
                            Opacity(
                                opacity: 0.0,
                                child: Divider(
                                  height: displayHeight(context) * 0.01,
                                )),
                            SignatureMoveText,
                            Opacity(
                                opacity: 0.0,
                                child: Divider(
                                  height: displayHeight(context) * 0.01,
                                )),
                            QuoteText,
                            Opacity(
                                opacity: 0.0,
                                child: Divider(
                                  height: displayHeight(context) * 0.01,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Missions :',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: displayWidth(context) * 0.043,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                VerticalDivider(),
                                (isMissionDataAvailable)
                                    ? PieChart(
                                        dataMap: missionMap,
                                        animationDuration:
                                            Duration(microseconds: 850000),
                                        chartLegendSpacing: 32,
                                        chartRadius:
                                            displayWidth(context) * 0.2,
                                        colorList: [
                                          Colors.red,
                                          Colors.deepPurple,
                                          Colors.blue[600],
                                          Colors.yellow[600],
                                          Colors.lightGreen
                                        ],
                                        initialAngleInDegree: 0,
                                        chartType: ChartType.ring,
                                        ringStrokeWidth: 25,
                                        centerText: "Missions",
                                        legendOptions: LegendOptions(
                                          showLegendsInRow: false,
                                          legendPosition: LegendPosition.left,
                                          showLegends: true,
                                          //legendShape: _BoxShape.circle,
                                          legendTextStyle: TextStyle(
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        chartValuesOptions: ChartValuesOptions(
                                          showChartValueBackground: true,
                                          showChartValues: true,
                                          showChartValuesInPercentage: false,
                                          showChartValuesOutside: true,
                                          decimalPlaces: 0,
                                        ),
                                      )
                                    : Text(
                                        "NA",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              displayWidth(context) * 0.043,
                                        ),
                                      )
                              ],
                            ),
                            Opacity(
                                opacity: 0.0,
                                child: Divider(
                                  height: displayHeight(context) * 0.01,
                                )),
                            Text(
                              'Character Info',
                              style: TextStyle(
                                  color: Colors.red[800],
                                  fontSize: displayWidth(context) * 0.045,
                                  fontWeight: FontWeight.bold),
                            ),
                            Opacity(
                                opacity: 0.0,
                                child: Divider(
                                  height: displayHeight(context) * 0.005,
                                )),
                            Text(
                              c.caseStudy,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: displayWidth(context)*0.036,
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
    );
  }
}
