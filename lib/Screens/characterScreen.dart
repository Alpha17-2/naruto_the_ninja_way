import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:naruto_the_ninja_way/Helper/DeviceSize.dart';

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
    return Container(
      height: displayHeight(context) * 0.7,
      width: displayWidth(context),
     // color: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(2),
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
          ],
        ),
      ),
    );
  }
}
