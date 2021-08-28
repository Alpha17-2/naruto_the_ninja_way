import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Models/clan.dart';

class clanDetail extends StatelessWidget {
  final Clan clan;
  clanDetail({this.clan});

  @override
  Widget build(BuildContext context) {
    final RichText villageText = RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Village : ",
          style: TextStyle(
              color: Colors.black,
              //fontWeight: FontWeight.w600,
              fontSize: displayWidth(context) * 0.043)),
      TextSpan(
          text: clan.village,
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              //fontFamily: 'Naruto',
              fontSize: displayWidth(context) * 0.043)),
    ]));
    final RichText signatureAbilityText = RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Ability : ",
          style: TextStyle(
              color: Colors.black,
              //fontWeight: FontWeight.w600,
              fontSize: displayWidth(context) * 0.043)),
      TextSpan(
          text: clan.signatureAbility,
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              //fontFamily: 'Naruto',
              fontSize: displayWidth(context) * 0.043)),
    ]));
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0,
                child: Container(
                  height: displayHeight(context) * 0.4,
                  width: displayWidth(context),
                  child: Image.asset(
                    clan.coverImage,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
                top: displayHeight(context) * 0.06,
                left: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: displayWidth(context) * 0.08,
                  onPressed: () => Navigator.pop(context),
                )),
            Positioned(
              bottom: 0,
              child: Container(
                height: displayHeight(context) * 0.65,
                width: displayWidth(context),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                clan.clanName,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black26,
                                      offset: Offset(2, 1.5),
                                    ),
                                  ],
                                  color: Colors.brown,
                                  fontWeight: FontWeight.w700,
                                  fontSize: displayWidth(context) * 0.095,
                                ),
                              ),
                              SizedBox(
                                width: displayWidth(context) * 0.04,
                              ),
                              Image.asset(
                                clan.village,
                                height: displayHeight(context) * 0.04,
                              ),
                            ],
                          ),
                        ),
                        Opacity(opacity: 0.0, child: Divider()),
                        Text(
                          clan.description +
                              " The signature ability of this clan is ${clan.signatureAbility}.",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: displayWidth(context) * 0.04,
                            //fontWeight: FontWeight.w700,
                            wordSpacing: 0.8,
                          ),
                        ),
                        Opacity(
                          opacity: 0.0,
                          child: Divider(
                            height: displayHeight(context) * 0.015,
                          ),
                        ),
                        Text("Clan Members",
                            style: GoogleFonts.nunito(
                              color: Colors.blue[800],
                              fontSize: displayWidth(context) * 0.05,
                              fontWeight: FontWeight.bold,
                            )),
                        Opacity(
                          opacity: 0.0,
                          child: Divider(
                            height: displayHeight(context) * 0.015,
                          ),
                        ),
                        Container(
                          height: displayHeight(context)*0.26,
                          width: displayWidth(context)*0.5,
                          //color: Colors.red,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                //tileColor: Colors.red,
                                leading: CircleAvatar(
                                  radius: displayWidth(context) * 0.055,
                                  backgroundImage: AssetImage(
                                    clan.members.values.toList()[index],
                                  ),
                                ),
                                title: Text(
                                  clan.members.keys.toList()[index],
                                  style: GoogleFonts.alegreyaSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: displayWidth(context)*0.045
                                  ),
                                ),
                              );
                            },
                            itemCount: clan.members.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: displayHeight(context) * 0.58,
                right: displayWidth(context) * 0.08,
                child: Container(
                  height: displayHeight(context) * 0.25,
                  width: displayWidth(context) * 0.3,
                  //color: Colors.green,
                  child: Hero(
                    tag: clan.standingMember,
                    child: FadeInImage(
                      fadeInCurve: Curves.easeInExpo,
                      placeholder: AssetImage(clan.standingMember),
                      fit: BoxFit.fitHeight,
                      image: AssetImage(clan.standingMember),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
