import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';

class displaySingleCharacter extends StatelessWidget {
  final String name;
  final String village;
  final String sex;
  final String clan;
  final String rank;
  final String villageSymbol;
  final String age;
  final String firstAppearance;
  final String quote;
  final String signatureMove;
  final String caseStudy;
  final List<String> images;
  final String noticeableFeature;

  displaySingleCharacter({
    this.name,
    this.villageSymbol,
    this.clan,
    this.noticeableFeature,
    this.sex,
    this.caseStudy,
    this.village,
    this.rank,
    this.age,
    this.firstAppearance,
    this.quote,
    this.signatureMove,
    this.images,
  });

  final Map<String, Color> rankColors = {
    'Genin': Colors.green[600],
    'Chunin': Colors.blue[800],
    'Jounin': Colors.purple[800],
    'Anbu': Colors.orange[800],
    'Kage': Colors.red[700],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.3,
      //color: Colors.red,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: displayHeight(context) * 0.05,
              child: Container(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.25,
                decoration: BoxDecoration(
                  // color: Colors.teal ,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Opacity(
                    opacity: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          images[images.length - 1],
                          fit: BoxFit.cover,
                        ))),
              )),
          Positioned(
              // transparent image 1 standing
              top: -5,
              left: 0,
              child: Image.asset(
                images[0],
                height: displayHeight(context) * 0.26,
                fit: BoxFit.fill,
              )),
          Positioned(
              top: displayHeight(context) * 0.1,
              right: displayWidth(context) * 0.03,
              child: Container(
                height: displayHeight(context) * 0.05,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10.0, top: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: displayWidth(context) * 0.035,
                          backgroundImage: AssetImage(noticeableFeature),
                        ),
                        Opacity(
                          opacity: 0.0,
                          child: VerticalDivider(
                            width: displayWidth(context) * 0.01,
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: displayWidth(context) * 0.04,
                            fontFamily: 'Naruto',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
              top: displayHeight(context) * 0.16,
              right: displayWidth(context) * 0.048,
              child: Container(
                height: displayHeight(context) * 0.11,
                width: displayWidth(context) * 0.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Village : ',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: displayWidth(context) * 0.0385,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                village,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: displayWidth(context) * 0.0385,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                villageSymbol,
                                width: displayWidth(context) * 0.06,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ],
                      ),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: displayWidth(context) * 0.0385,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(text: "Age : "),
                            TextSpan(
                                text: age,
                                style: TextStyle(color: Colors.black)),
                          ])),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: displayWidth(context) * 0.0385,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(text: "Rank : "),
                            TextSpan(
                                text: rank,
                                style: TextStyle(color: rankColors[rank])),
                          ]))
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
