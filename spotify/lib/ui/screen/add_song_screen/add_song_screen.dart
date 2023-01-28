import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/ui/screen/add_song_screen/add_song_view.dart';

class AddSongScreen extends StatelessWidget {
  const AddSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Song"),
        centerTitle: true,
      ),
      body: const AddSongView(),
    );
  }
}
