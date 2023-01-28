import 'package:flutter/material.dart';
import '../../widgets/main_screens_scaffold.dart';
import '../../widgets/under_construction_view.dart';

class PlaylistsScreen extends StatelessWidget {
  const PlaylistsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreensScaffold(title: "Playlists", index: 0, child: UnderConstructionView());
  }
}

