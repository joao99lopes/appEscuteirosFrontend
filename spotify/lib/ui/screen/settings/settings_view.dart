import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/ui/screen/settings/settings_tile.dart';

import '../../../theme.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              minRadius: screenWidth * 0.05,
              maxRadius: screenWidth * 0.12,
              backgroundImage: const NetworkImage("https://static01.nyt.com/images/2020/05/16/business/16JORDAN-01sub/16JORDAN-01sub-jumbo.jpg?quality=75&auto=webp"),
            ),
          ),
          SettingsTile(title: "Account", icon: Icons.person,),
          SettingsTile(title: "Add song", icon: Icons.add,),
          SettingsTile(title: "Settings", icon: Icons.settings),
        ],
      ),
    );
  }
}
