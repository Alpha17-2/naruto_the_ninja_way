import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Helper/widgets.dart';
import 'package:naruto_the_ninja_way/Models/clan.dart';
import 'package:naruto_the_ninja_way/Screens/clanDetail.dart';

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
    final Map<String,String> SenjuMap = {
      'Hashirama Senju':'images/circleAvatar/hashirama.jpg',
      'Tobirama Senju' : 'images/circleAvatar/tobirama.jpg',
      'Tsunade senju' : 'images/circleAvatar/tsunade.jpg',
      'Senju Touka' : 'images/circleAvatar/touka.jpg',
    };
    final Map<String,String> UchihaMap = {
      'Uchiha Madara':'images/circleAvatar/madara.jpg',
      'Uchiha Itachi': 'images/circleAvatar/itachi.jpg',
      'Uchiha Sasuke': 'images/circleAvatar/sasuke.jpg',
      'Uchiha Shisui' : 'images/circleAvatar/shishui.jpg',
      'Uchiha Izuna' : 'images/circleAvatar/izuna.jpg',
    };
    final List<Widget> _tiles = [
      Hero(
        tag: clanStandingMember[0],
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>clanDetail(clan: Clan(
              village: "images/villages/leafCenter.png",
              clanColor: Colors.brown,
              coverImage: clanImages[0],
              clanName: clanName[0],
              standingMember: clanStandingMember[0],
              description: "Senju (Thousand Arms) of the Forest were one of the founding clans of Konoha. Under Senju Hashirama, they allied with other clans including the Uchiha, to found the Fire Country's ninja village. It is unknown if Senju retains a clan structure in the current Konoha. Tsunade is the only known living descendant of founding clan of Konoha.",
              members: SenjuMap,
              signatureAbility: "Mokuton",
            ),)));
          },
            child: clanCard(context,clanName[0],clanImages[0],Colors.brown,clanStandingMember[0])),
      ),
      Hero(
        tag: clanStandingMember[1],
          child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>clanDetail(clan: Clan(
            village: "images/villages/leafCenter.png",
            clanColor: Colors.red[800],
            coverImage: clanImages[1],
            clanName: clanName[1],
            standingMember: clanStandingMember[1],
            description: "This clan from Konoha Village is known for its ability to copy Genjutsu, Taijutsu and Ninjutsu and then replicate it at will. Clan members have the ability to alter their eyes to take the form of 'Sharingan'. With their eyes in this form clan members can copy the movement of those they examine.",
            members: UchihaMap,
            signatureAbility: "Sharigan , Mangekyu Sharingan",
          ),)));
        },
          child: clanCard(context, clanName[1], clanImages[1],Colors.red[800], clanStandingMember[1]))),
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
