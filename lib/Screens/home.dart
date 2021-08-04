import 'package:flutter/material.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Screens/characterScreen.dart';

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

  ];

  @override
  Widget build(BuildContext context) {
    Widget displayMenu(int index){
      return Padding(
        padding: const EdgeInsets.only(right:6.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentMenu=index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: (currentMenu==index)?[
                  Colors.red[200],
                  Colors.red[300],
                  Colors.red[400],
                ]:
                [
                  Colors.white,
                Colors.white,
                ],
              )
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top:10.0,bottom: 10,right: 16,left: 16),
                child: Text(menu[index],style: TextStyle(
                  fontSize: displayWidth(context)*0.036,
                  fontWeight: FontWeight.bold,
                  color: (currentMenu==index)?Colors.white:Colors.black54,
                ),),
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
            height: displayHeight(context),
            width: displayWidth(context),
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: displayHeight(context) * 0.02,
                  left: displayWidth(context) * 0.03,
                  child: Image.asset('images/general/b.png',
                      height: displayHeight(context) * 0.2,
                      width: displayWidth(context) * 0.3,
                      fit: BoxFit.cover),
                ),
                Positioned(
                    top: displayHeight(context) * 0.03,
                    left: displayWidth(context) * 0.37,
                    child: Container(
                      height: displayHeight(context) * 0.15,
                      width: displayWidth(context) * 0.575,
                      //color: Colors.black87,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/general/heading.png',
                            height: displayHeight(context) * 0.045,
                            fit: BoxFit.fitWidth,
                          ),
                          Image.asset(
                            'images/general/subHeading.png',
                            height: displayHeight(context) * 0.0425,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  top: displayHeight(context) * 0.24,
                  child: Container(
                    height: displayHeight(context) * 0.05,
                    width: displayWidth(context) * 0.95,
                    //color: Colors.black87,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return displayMenu(index);
                    },
                      scrollDirection: Axis.horizontal,
                      itemCount: menu.length,
                    ),
                  ),
                ),
                Positioned(
                  top: displayHeight(context)*0.315,
                  child: screens[currentMenu],),
              ],
            ),
          )),
    );
  }
}
