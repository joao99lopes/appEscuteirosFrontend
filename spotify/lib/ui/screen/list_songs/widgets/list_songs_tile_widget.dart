import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/theme.dart';
import 'package:spotify/ui/screen/list_songs/list_songs_controller.dart';

class ListSongsTileWidget extends StatelessWidget {
  const ListSongsTileWidget({Key? key, required this.controller, required this.index}) : super(key: key);

  final ListSongsController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.color2
            ),
            child: Text(
              controller.filteredSongs[index].title,
              style: const TextStyle(fontSize: 20),
            ),
          )
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     controller.filteredSongs[index].title,
          //     style: const TextStyle(fontSize: 20),
          //   ),
          // ),
          // const Divider(color: Colors.lightBlueAccent,),

        ],
      ),
      onTap: () {
        print(controller.filteredSongs[index].title);
        controller.onSongSelected(controller.filteredSongs[index]);
      },
    );
  }
}




