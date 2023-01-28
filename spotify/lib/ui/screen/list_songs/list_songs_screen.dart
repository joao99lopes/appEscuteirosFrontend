import 'package:flutter/material.dart';
import '../../widgets/main_screens_scaffold.dart';
import 'list_songs_view.dart';

class ListSongsScreen extends StatelessWidget {
  const ListSongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreensScaffold(title: "List Songs", index: 1, child: ListSongsView());
  }
}

