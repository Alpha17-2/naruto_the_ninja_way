import 'package:flutter/material.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
class senjuClan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  height: displayHeight(context)*0.4,
                  width: displayWidth(context),
                  child: Image.asset('images/Clans/senju.jpg',fit: BoxFit.fill,),
                )),
            Positioned(
              top: displayHeight(context)*0.06,
                left: 0,
                child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: displayWidth(context)*0.08,
                  onPressed: () => Navigator.pop(context),
            )),
            Positioned(
              bottom: 0,
                child: Container(
                  height: displayHeight(context)*0.65,
                  width: displayWidth(context),
                  decoration: BoxDecoration(
                   color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Padding(
                         padding: const EdgeInsets.only(left:8.0),
                         child: Text('Senju',style: TextStyle(
                           decoration: TextDecoration.underline,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  offset: Offset(2,1.5),
                                ),
                              ],
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: displayWidth(context)*0.095,
                            ),
                          ),
                       ),
                        Divider(),
                        Text("Senju (Thousand Arms) of the Forest were one of the founding clans of Konoha. Under Senju Hashirama, they allied with other clans including the Uchiha, to found the Fire Country's ninja village. It is unknown if Senju retains a clan structure in the current Konoha. Tsunade is the only known living descendant of founding clan of Konoha.",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: displayWidth(context)*0.04,
                            fontWeight: FontWeight.w700,
                            wordSpacing: 0.8,
                          ),),
                      ],
                    ),
                  ),
                )),
            Positioned(
              bottom: displayHeight(context)*0.58,
                right: displayWidth(context)*0.08,
                child: Container(
              height: displayHeight(context)*0.25,
              width: displayWidth(context)*0.3,
              //color: Colors.green,
                  child: Hero(
                    tag: "1",
                    child: FadeInImage(
                      fadeInCurve: Curves.easeInExpo,
                      placeholder: AssetImage('images/Clans/hashirama.png'),
                      fit: BoxFit.fitHeight,
                      image: AssetImage('images/Clans/hashirama.png'),
                    ),
                  ),
            )),


          ],
        ),
      ),
    );
  }
}
