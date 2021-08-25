import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Helper/widgets.dart';

class clanScreeen extends StatelessWidget {
  final List<String> clanImages = [
    'images/Clans/senju.jpg',
    'images/Clans/uchiha.jpg',
    'images/Clans/uzumaki.jpg',
    'images/Clans/akimichi.jpg',
    'images/Clans/aburame.jpg',
    'images/Clans/hyuga.jpg',
    'images/Clans/nara.jpg',
    'images/Clans/sarutobi.jpg',
  ];
  final List<String> clanName = [
    'Senju Clan',
    'Uchiha Clan',
    'Uzumaki Clan',
    'Akimichi Clan',
    'Hyuga Clan',
    'Aburame Clan',
    'Nara Clan',
    'Sarutobi Clan',
  ];
  final List<String> clanStandingMember = [
    'images/Clans/hashirama.png',
    'images/Clans/madara.png',
    'images/Clans/naruto.png',
    'images/characters/Chouji/6.png',
    'images/Clans/neji.png',
    'images/Clans/shino.png',
    'images/Clans/shikamaru.png',
    'images/Clans/sarutobiCharcter.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.71,
      width: displayWidth(context),
      //color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.only(left:10.0,right: 10.0),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //childAspectRatio: 0.4,
          crossAxisCount: 2,
          //mainAxisExtent: 10,
          crossAxisSpacing: 14,
          mainAxisSpacing: 16,
        ), itemBuilder: (context, index) {
          return clanCard(context,clanName[index],clanImages[index],clanStandingMember[index]);
        },
          itemCount: clanName.length,
        )
      ),
    );
  }
}
