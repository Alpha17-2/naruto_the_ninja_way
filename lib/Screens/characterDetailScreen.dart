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
    final List<dynamic> mainContent = [
      Container(
        height: displayHeight(context) * 0.195,
        width: displayWidth(context) * 0.75,
        //color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              twoTexts(context, "Village", c.village),
              myDivider,
              twoTexts(context, "Sex", c.sex),
              myDivider,
              twoTexts(context, "Age", c.age),
              myDivider,
              twoTexts(context, "Birthday", c.dob),
              myDivider,
              twoTexts(context, "Height", c.height),
              myDivider,
              twoTexts(context, "Weight", c.weight),
            ],
          ),
        ),
      ),
      // Ninja Way
      Container(
        height: displayHeight(context) * 0.195,
        width: displayWidth(context) * 0.75,
        //color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              twoTexts(context, "Clan", c.clan),
              myDivider,
              twoTexts(context, "Rank", c.rank),
              myDivider,
              twoTexts(context, "Age", c.signatureMove),
              myDivider,
              twoTexts(context, "First Appearance", c.firstAppearance),
              myDivider,
              twoTexts(context, "Quote", c.quote),
            ],
          ),
        ),
      ),
      // Missions
      Container(
        height: displayHeight(context) * 0.195,
        width: displayWidth(context) * 0.75,
        //color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              twoTexts(context, "S-Rank", c.srank),
              myDivider,
              twoTexts(context, "D-Rank", c.drank),
              myDivider,
              twoTexts(context, "C-Rank", c.crank),
              myDivider,
              twoTexts(context, "B-Rank", c.brank),
              myDivider,
              twoTexts(context, "A-Rank", c.arank),
            ],
          ),
        ),
      ),
      // About
      Container(
        height: displayHeight(context) * 0.22,
        width: displayWidth(context) * 0.79,
       // color: Colors.black,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom:4.0),
            child: Text(c.caseStudy,style: TextStyle(
              color: Colors.black,
              fontSize: displayWidth(context)*0.035,
              fontWeight: FontWeight.w400,
              wordSpacing: 1.2,
            ),),
          )
        ),
      ),


    ];
    displayContainerBox(character c, BuildContext context,int index) {
      return Container(
        height: displayHeight(context) * 0.325,
        width: displayWidth(context) * 0.9,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white70),
        ),
        child: Center(
          child: Container(
            height: displayHeight(context) * 0.3,
            width: displayWidth(context) * 0.855,
            decoration: BoxDecoration(
                color: Colors.white70.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 8.0, right: 8.0, bottom: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'images/general/kunai.png',
                          height: displayHeight(context) * 0.04,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          categories[currentCategory],
                          style: TextStyle(
                            color: Colors.teal[600],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Acme',
                            fontSize: displayWidth(context) * 0.06,
                          ),
                        ),
                        Image.asset(
                          'images/general/kunai.png',
                          height: displayHeight(context) * 0.04,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1.8,
                      indent: displayWidth(context) * 0.1,
                      endIndent: displayWidth(context) * 0.1,
                    ),
                    mainContent[currentCategory],
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          color: Color(0xfbfaf0e6),
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
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: displayHeight(context) * 0.6,
                    width: displayWidth(context),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xfb434343),
                            Color(0xfb000000),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                  )),
              Positioned(
                top: displayHeight(context) * 0.03 + kToolbarHeight,
                child: Container(
                  height: displayHeight(context) * 0.35,
                  width: displayWidth(context),
                  // color: Colors.red[200],
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: displayHeight(context) * 0.35,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.45,
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
                ),
              ),
              Positioned(
                top: displayHeight(context) * 0.475,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      c.name,
                      style: TextStyle(
                        // decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: displayWidth(context) * 0.06,
                        color: Colors.yellow,
                        fontFamily: 'Naruto',
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.02,
                    ),
                    CircleAvatar(
                      radius: displayWidth(context) * 0.04,
                      backgroundImage: AssetImage(c.villageSymbol),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: displayHeight(context) * 0.56,
                child: Container(
                  height: displayHeight(context) * 0.05,
                  width: displayWidth(context) * 0.95,
                  // color: Colors.white,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return displayMenu(index);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                  ),
                ),
              ),
              Positioned(
                  bottom: displayHeight(context) * 0.02,
                  child: Container(
                    height: displayHeight(context) * 0.35,
                    width: displayWidth(context) * 0.95,
                    //color: Colors.white54,
                    child: Center(child: displayContainerBox(c, context,currentCategory)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
