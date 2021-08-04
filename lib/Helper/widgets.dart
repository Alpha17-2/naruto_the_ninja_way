import 'package:flutter/material.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';

class displaySingleCharacter extends StatelessWidget {
  final String name;
  final String village;
  final String sex;
  final String rank;
  final String age;
  final String firstAppearance;
  final String quote;
  final String signatureMove;
  final String caseStudy;
  final List<String> images;

    displaySingleCharacter({
    this.name,
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
      height: displayHeight(context)*0.22,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(images[3])
              ,fit: BoxFit.fitWidth,
        ),
        color: Colors.pink,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [

        ],
      ),
    );
  }
}
