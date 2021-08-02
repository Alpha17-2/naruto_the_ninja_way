import 'package:naruto_the_ninja_way/Models/character.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class listOfCharacters extends ChangeNotifier{

  final List<character> characters=[
    character(
      name: "Aburame Shino",
      age: "16",
      rank: "Chunin",
      village: "Leaf",
      firstAppearance: "Episode 1",
      sex: "Male",
      signatureMove: "Kikaichuu no Jutsu",
      quote: "Even if our enemy is a small bug, we will not underestimate it.",  
      images: [],
      caseStudy: "Shino's appearances in the series are few and far between. Shino has yet to take the forefront in any series arc, instead acting as a minor support player. His strong, unshakable confidence, mysterious look and cool aura make him popular among fans despite his ultimately creepy habits. His analytical skill and cautious nature often annoy Kiba, who thinks Shino is trying to become the de facto leader of the team.Shino was assigned along with Hyuuga Hinata and Inuzaka Kiba to the tutelage of Yuuhi Kurenai. Even to his own team, he remained much of an enigma. His true abilities were first seen in the Chuunin Exam when he faced Zaku. A hole opened up in Shino�s face and to the disgust of most watching, hordes of bugs began to crawl all over his skin. Shino revealed to his opponent that the bugs would eat his chakra, rendering him too weak to move. Trapping Zaku between himself and his army, Shino demanded surrender. When Zaku threatened to attack both of them simultaneously, Shino revealed that he had a hidden surprise, sending his bugs inside Zaku's weapon to jam it. Because Zaku's weapons were integrated into his physical arms, they were damaged beyond repair. Shino explains that having a trump card or ace in the hole is vital in battle.Because of his victory, Shino advanced to the finals of the exam, slated to face Kankurou. However, when their match was to take place, Kankurou instantly gave in. The reason, it was later revealed, was to prevent anyone seeing his hidden techniques with his puppet, Karasu. Gaara�s instability then caused the premature plan of the combined Sand and Sound invasion. Shino watched as Kankurou and his siblings retreated to help Gaara, following them in secret. As Kankurou prepared to take on Sasuke to slow him down, Shino stepped in and demanded the match he had been deprived of.Demonstrating some of the Destruction Bugs� more unusual abilities, Shino used them to make a decoy of himself, while moving close to Kankurou to strike at him. While Shino�s hand-to-hand skills were none too impressive, he had deliberately made a feint to plant a female bug on Kankurou, giving the rest of his bugs a permanent target to chase after. Despite Kankurou managing to catch Shino with a poison gas bomb, Shino forced the stalemate as his bugs tracked Kankurou down and left him paralyzed after eating all his chakra. Shino�s father later appeared and saved his life, injecting him with his own bugs that ate away the poison. Later, Shino would be absent from the mission to rescue Sasuke, on a mission with his father. Over the next few years Shino would again take the Chuunin Exam and finally be promoted to Chuunin.Upon Naruto's return to the village, Shino was hurt that he was not quickly recognized. Some weeks later, Team 8 under the leadership of Kakashi joined with Team 7 to hunt down Uchiha Itachi in the hopes of finding Sasuke. The team set out and managed to locate Akatsuki member Tobi. Shino tried to use his bugs, but Tobi's ability to phase through matter and transport himself allowed him to avoid harm. When the team eventually tracked down Sasuke's location, they came upon the ruins of Sasuke and Itachi's fight. Both brothers were gone, leaving the teams empty handed, so they returned to Konoha."
    ),
  ];

}