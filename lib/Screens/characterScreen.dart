import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';
import 'package:naruto_the_ninja_way/Helper/widgets.dart';
import 'package:naruto_the_ninja_way/Models/character.dart';
import 'package:naruto_the_ninja_way/Providers/listOfCharacters.dart';

class characterScreen extends StatefulWidget {
  @override
  _characterScreenState createState() => _characterScreenState();
}

class _characterScreenState extends State<characterScreen> {
  TextEditingController searchCharacterController;
  List<character> _list = listOfCharacters().allCharacters;
  List<character> displayCharacterList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchCharacterController = TextEditingController();
    displayCharacterList = _list;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchCharacterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context)*0.73,
      width: displayWidth(context),
        //color: Colors.red,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
                    onChanged: (value) {
                      List<character> temp = [];
                      if (value.isEmpty ||
                          value == null ||
                          value.length == 0 ||
                          value == '')
                        temp = _list;
                      else
                        temp = _list
                            .where((element) => element.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      setState(() {
                        displayCharacterList = temp;
                        print(displayCharacterList.toString());
                      });
                    },
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
              top: displayHeight(context) * 0.073,
              child: Container(
                height: displayHeight(context) * 0.7,
                width: displayWidth(context) * 0.9,
                 //color: Colors.black45,
                child: displayCharacterList.length == 0
                    ? Center(
                        child: Text('Oops ! No such character found'),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 0.0),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: displaySingleCharacter(characterIndex: index,
                            ),
                          );
                        },
                        itemCount: displayCharacterList.length,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
