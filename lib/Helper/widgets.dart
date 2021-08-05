import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';

class displaySingleCharacter extends StatelessWidget {
  final String name;
  final String village;
  final String sex;
  final String clan;
  final String rank;
  final String age;
  final String firstAppearance;
  final String quote;
  final String signatureMove;
  final String caseStudy;
  final List<String> images;
  final String noticeableFeature;

  displaySingleCharacter({
    this.name,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.3,
      //color: Colors.red,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: displayHeight(context) * 0.1,
              child: Container(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.2,
                decoration: BoxDecoration(
                  // color: Colors.teal ,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Opacity(
                    opacity: 0.25,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          images[3],
                          fit: BoxFit.cover,
                        ))),
              )),
          Positioned(
              top: 0,
              left: displayWidth(context) * 0.02,
              child: Image.asset(
                images[0],
                height: displayHeight(context) * 0.25,
                fit: BoxFit.fill,
              )),
          Positioned(
              top: displayHeight(context) * 0.105,
              right: displayWidth(context) * 0.04,
              child: Container(
                height: displayHeight(context) * 0.05,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12.0, top: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: displayWidth(context) * 0.03,
                          backgroundImage: AssetImage(noticeableFeature),
                        ),
                        VerticalDivider(
                          width: displayWidth(context) * 0.01,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: displayWidth(context) * 0.03,
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
              right: displayWidth(context) * 0.04,
              child: Container(
                height: displayHeight(context) * 0.135,
                width: displayWidth(context) * 0.36,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text("Village : ${village} village",style: TextStyle(
                      color: Colors.black54,
                      fontSize: displayWidth(context)*0.03,
                      fontWeight: FontWeight.bold,
                    ),)],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
