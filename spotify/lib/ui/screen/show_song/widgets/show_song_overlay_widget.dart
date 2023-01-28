import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spotify/ui/screen/show_song/show_song_controller.dart';

import '../../../../theme.dart';

class ShowSongOverlay extends StatelessWidget {
  final ShowSongController controller;

  const ShowSongOverlay({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    FlutterSecureStorage storage = FlutterSecureStorage();
    return Material(
      elevation: 30,
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(30),
        width: screenWidth * 0.9,
        height: screenHeight * 0.3,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: CustomColors.color1
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Text("Font Size")
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => controller.decreaseFontSize(),
                  child: Container(
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                        color: Colors.grey
                    ),
                    child: Icon(Icons.remove),
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.05,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: CustomColors.color1
                  ),
                  child: Text(controller.lyricsFontSize.toString(), style: TextStyle(fontSize: 20),),
                )
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => controller.increaseFontSize(),
                  child: Container(
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                        color: Colors.grey
                    ),
                    child: Icon(Icons.add),
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}