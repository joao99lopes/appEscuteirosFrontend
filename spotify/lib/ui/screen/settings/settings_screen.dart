import 'package:flutter/material.dart';
import 'package:spotify/ui/screen/settings/settings_view.dart';
import '../../widgets/main_screens_scaffold.dart';
import '../../widgets/under_construction_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const MainScreensScaffold(title: "Playlists", index: 2, child: UnderConstructionView());
    return const MainScreensScaffold(title: "Settings", index: 2, child: SettingsView());
  }
}

