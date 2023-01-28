import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/ui/screen/show_song/show_song_view.dart';

class ShowSongScreen extends StatelessWidget {
  const ShowSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? title = Get.parameters['title'];
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title!)),
      ),

      body: ShowSongView(
        title: title,
      ),
    );
  }
}
