import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Helper/widgets.dart';
import 'package:naruto_the_ninja_way/Screens/allClans/senjuClan.dart';

class clanScreeen extends StatelessWidget {
  final List<String> clanImages = [
    'images/Clans/senju.jpg',
    'images/Clans/uchiha.jpg',
    'images/Clans/uzumaki.jpg',
    'images/Clans/akimichi.jpg',
    'images/Clans/hyuga.jpg',
    'images/Clans/aburame.jpg',
    'images/Clans/nara.jpg',
    'images/Clans/sarutobi.jpg',
  ];
  final List<String> clanName = [
    'Senju',
    'Uchiha',
    'Uzumaki',
    'Akimichi',
    'Hyuga',
    'Aburame',
    'Nara',
    'Sarutobi',
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
    final List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 3),
      StaggeredTile.count(2, 2.5),
      StaggeredTile.count(2, 2.8),
      StaggeredTile.count(2, 3),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 3),
      StaggeredTile.count(2, 4),
    ];
    final List<Widget> _tiles = [
      Hero(
        tag: "1",
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>senjuClan()));
          },
            child: clanCard(context,clanName[0],clanImages[0],Colors.black,clanStandingMember[0])),
      ),
      clanCard(context, clanName[1], clanImages[1],Colors.red[800], clanStandingMember[1]),
      clanCard(context,clanName[2],clanImages[2],Colors.orange[800],clanStandingMember[2]),
      clanCard(context, clanName[3], clanImages[3],Colors.pink[600], clanStandingMember[3]),
      clanCard(context, clanName[4], clanImages[4],Colors.green[600], clanStandingMember[4]),
      clanCard(context, clanName[5], clanImages[5],Colors.black54, clanStandingMember[5]),
      clanCard(context, clanName[6], clanImages[6],Colors.deepPurple, clanStandingMember[6]),
      clanCard(context, clanName[7], clanImages[7],Colors.green[400], clanStandingMember[7]),
    ];
    return Container(
      height: displayHeight(context) * 0.71,
      width: displayWidth(context),
      //color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: _staggeredTiles,
          mainAxisSpacing: 18,
          crossAxisSpacing: 15,
          padding: const EdgeInsets.all(4),
          children: _tiles,
        ),
      ),
    );
  }
}
