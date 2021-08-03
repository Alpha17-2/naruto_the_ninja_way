import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: Container(
            height: displayHeight(context),
            width: displayWidth(context),
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  top: displayHeight(context)*0.02,
                  left: displayWidth(context)*0.03,
                  child: Image.asset('images/general/b.png',height: displayHeight(context)*0.2,
                    width: displayWidth(context)*0.3,
                  fit:BoxFit.cover),
                ),
                Positioned(
                  top: displayHeight(context)*0.02,
                    left: displayWidth(context)*0.37,
                    child: Container(
                      height: displayHeight(context)*0.15,
                      width: displayWidth(context)*0.575,
                      //color: Colors.black87,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('images/general/heading.png',
                            height: displayHeight(context)*0.042,
                            fit: BoxFit.fitWidth,),
                          Image.asset('images/general/subHeading.png',
                            height: displayHeight(context)*0.041,
                            fit: BoxFit.fitWidth,),
                        ],
                      ),
                    )
                ),
              ],
            ),
          )),
    );
  }
}
