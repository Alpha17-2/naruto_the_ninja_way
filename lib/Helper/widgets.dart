import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Models/character.dart';
import 'package:naruto_the_ninja_way/Providers/listOfCharacters.dart';
import 'package:naruto_the_ninja_way/Screens/characterDetailScreen.dart';

class displaySingleCharacter extends StatelessWidget {
  final int characterIndex;
  displaySingleCharacter({this.characterIndex});

  final Map<String, Color> rankColors = {
    'Genin': Colors.green[600],
    'Chunin': Colors.blue[800],
    'Jounin': Colors.purple[800],
    'Anbu': Colors.orange[800],
    'Kage': Colors.red[700],
  };

  @override
  Widget build(BuildContext context) {
    final character c = listOfCharacters().allCharacters[characterIndex];
    final String name = c.name;
    final String coverImage = c.coverImage;
    final List<String> images = c.images;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => charcterDetailScreen(
                      indexOfCharacter: characterIndex,
                    )));
      },
      child: Container(
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
                    image: DecorationImage(
                      image: AssetImage(coverImage),fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                )),
            Positioned(
              // opacity
                top: displayHeight(context) * 0.05,
                child: Container(
                  width: displayWidth(context) * 0.9,
                  height: displayHeight(context) * 0.25,
                  decoration: BoxDecoration(
                    // color: Colors.teal ,
                    gradient: LinearGradient(
                        end: const Alignment(0, 0.4),
                        begin: const Alignment(0.0, 0.15),
                      colors:<Color>[
                       Color(0xfb1a1a1a).withOpacity(0.0),
                        Color(0xfb1a1a1a).withOpacity(0.0),
                        Color(0xfb1a1a1a).withOpacity(0.8),

                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
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
              // title
              bottom: displayHeight(context)*0.035,
              right: displayWidth(context)*0.04,
              child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: displayWidth(context) * 0.045,
                fontWeight: FontWeight.bold,
                //fontFamily: 'BreeSerif',
              ),
            ),),

            Positioned(
              // village
              bottom: displayHeight(context)*0.015,
              right: displayWidth(context)*0.04,
              child: Text(
                "${c.village} village",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: displayWidth(context) * 0.038,
                  //fontFamily: 'BreeSerif',
                ),
              ),)
          ],
        ),
      ),
    );
  }
}

twoTexts(BuildContext ctx, String first, String second) {
  return RichText(
    text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: displayWidth(ctx) * 0.04,
        ),
        children: [
          TextSpan(
            text: first + " : ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: second,
            style:
            TextStyle(fontWeight: FontWeight.w400, color: Colors.black87),
          ),
        ]),
  );
}

