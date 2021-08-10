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
                top: displayHeight(context) * 0.03 + kToolbarHeight,
                child: Container(
                  height: displayHeight(context)*0.35,
                  width: displayWidth(context),
                 // color: Colors.red[200],
                  child:  CarouselSlider(
                    options: CarouselOptions(
                      height: displayHeight(context)*0.35,
                      aspectRatio: 16/9,
                      viewportFraction: 0.45,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      //onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return  Image.asset(i);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Positioned(
                bottom : 0,
                  child: Container(
                //color: Colors.blue[200],
                height: displayHeight(context)*0.52,
                width: displayWidth(context),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(name,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              fontSize: displayWidth(context)*0.06,
                              color: Colors.teal[600],
                              fontFamily: 'Naruto',
                              letterSpacing: 1.2,
                            ),),
                          )
                        ],
                      ),
                    ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
