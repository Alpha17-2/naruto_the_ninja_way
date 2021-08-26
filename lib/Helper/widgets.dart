import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Models/character.dart';
import 'package:naruto_the_ninja_way/Providers/listOfCharacters.dart';
import 'package:naruto_the_ninja_way/Screens/characterDetailScreen.dart';

class displaySingleCharacter extends StatelessWidget {
  final int characterIndex;
  displaySingleCharacter({this.characterIndex});

  @override
  Widget build(BuildContext context) {
    final character c = listOfCharacters().allCharacters[characterIndex];
    final String name = c.name;
    final String coverImage = c.coverImage;
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
        width: displayWidth(context) * 0.9,
        height: displayHeight(context) * 0.25,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(coverImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: Colors.black54, width: displayWidth(context) * 0.02)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                // opacity
                top: 0,
                child: Container(
                  width: displayWidth(context) * 0.86,
                  height: displayHeight(context) * 0.242,
                  decoration: BoxDecoration(
                    // color: Colors.teal ,
                    gradient: LinearGradient(
                      end: const Alignment(0, 0.4),
                      begin: const Alignment(0.0, 0.15),
                      colors: <Color>[
                        Color(0xfb1a1a1a).withOpacity(0.0),
                        Color(0xfb1a1a1a).withOpacity(0.0),
                        Color(0xfb1a1a1a).withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                )),
            Positioned(
              // title
              bottom: displayHeight(context) * 0.03,
              right: displayWidth(context) * 0.06,
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: displayWidth(context) * 0.045,
                  fontWeight: FontWeight.bold,
                  //fontFamily: 'BreeSerif',
                ),
              ),
            ),
            Positioned(
              // village
              bottom: displayHeight(context) * 0.01,
              right: displayWidth(context) * 0.06,
              child: Text(
                "${c.village} village",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: displayWidth(context) * 0.038,
                  //fontFamily: 'BreeSerif',
                ),
              ),
            )
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
          fontSize: displayWidth(ctx) * 0.035,
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

Widget clanCard(BuildContext context, String clanName, String clanImage,
    String standingMember) {
  return Container(
    //color: Colors.white,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Opacity(
            alwaysIncludeSemantics: true,
            opacity: 0.85,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  clanImage,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
            bottom: 0.0,
            child: Container(
              height: displayHeight(context) * 0.06,
              width: displayWidth(context) * 0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
            )),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: displayHeight(context) * 0.18,
              width: displayWidth(context) * 0.25,
              // color: Colors.red,
              child: FadeInImage(
                placeholder: AssetImage(standingMember),
                fit: BoxFit.fitHeight,
                image: AssetImage(standingMember),
              ),
            )),
        Positioned(
            bottom: 0,
            left: displayWidth(context) * 0.24,
            child: Container(
              height: displayHeight(context) * 0.06,
              width: displayWidth(context) * 0.19,
              //color: Colors.red,
              child: Center(
                child: Text(
                  clanName,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: displayWidth(context) * 0.038,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ))
      ],
    ),
  );
}
