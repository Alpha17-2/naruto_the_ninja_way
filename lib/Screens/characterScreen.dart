import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Helper/widgets.dart';
import 'package:naruto_the_ninja_way/Providers/listOfCharacters.dart';
import 'package:provider/provider.dart';

class characterScreen extends StatefulWidget {
  @override
  _characterScreenState createState() => _characterScreenState();
}

class _characterScreenState extends State<characterScreen> {
  final _searchCharacterKey = GlobalKey<FormState>();
  TextEditingController searchCharacterController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchCharacterController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    searchCharacterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final charactersProvider =  Provider.of<listOfCharacters>(context);
    return Container(
      height: displayHeight(context) * 0.7,
      width: displayWidth(context),
     // color: Colors.red,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0,right: 10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                height: displayHeight(context) * 0.065,
                width: displayWidth(context) * 0.92,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    toolbarOptions: ToolbarOptions(
                        copy: true, cut: true, selectAll: true, paste: true),
                    controller: searchCharacterController,
                    autofocus: false,

                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Ionicons.search),
                        onPressed: () {
                          // TO-DO - Search for a character
                        },
                      ),
                      hintText: "Search for your characters",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    showCursor: true,
                  ),
                ),
              ),
            ),
            Positioned(
              top: displayHeight(context)*0.1,
                child: Container(
              height: displayHeight(context)*0.58,
              width: displayWidth(context)*0.9,
              color: Colors.black45,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 12.0),
                      itemBuilder: (context, index) {
                      return displaySingleCharacter(
                        clan: charactersProvider.ListOfCharacters[index].clan,
                        noticeableFeature: charactersProvider.ListOfCharacters[index].noticeableFeature,
                          age: charactersProvider.ListOfCharacters[index].age,
                          caseStudy: charactersProvider.ListOfCharacters[index].caseStudy,
                          firstAppearance: charactersProvider.ListOfCharacters[index].firstAppearance,
                          images: charactersProvider.ListOfCharacters[index].images,
                          name: charactersProvider.ListOfCharacters[index].name,
                          quote: charactersProvider.ListOfCharacters[index].quote,
                          rank: charactersProvider.ListOfCharacters[index].rank,
                          sex: charactersProvider.ListOfCharacters[index].sex,
                          signatureMove: charactersProvider.ListOfCharacters[index].signatureMove,
                          village: charactersProvider.ListOfCharacters[index].village,
                          
                      );
                    },
                      itemCount: charactersProvider.ListOfCharacters.length,
                    ),
                  ),

            ))
          ],
        ),
      ),
    );
  }
}
