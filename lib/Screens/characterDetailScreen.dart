import 'package:flutter/material.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Models/character.dart';
import 'package:naruto_the_ninja_way/Providers/listOfCharacters.dart';
class charcterDetailScreen extends StatelessWidget {
  final int indexOfCharacter;
  charcterDetailScreen({this.indexOfCharacter});
  @override
  Widget build(BuildContext context) {
    final character c = listOfCharacters().allCharacters[indexOfCharacter];
    final String name=c.name;
    final String village = c.village;
    final String sex=c.sex;
    final String clan=c.clan;
    final String rank=c.rank;
    final String villageSymbol=c.villageSymbol;
    final String age=c.age;
    final String firstAppearance=c.firstAppearance;
    final String quote=c.quote;
    final String signatureMove=c.signatureMove;
    final String caseStudy=c.caseStudy;
    final List<String> images=c.images;
    final String noticeableFeature=c.noticeableFeature;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        title: Text('Details'),
      ),
    );
  }
}
