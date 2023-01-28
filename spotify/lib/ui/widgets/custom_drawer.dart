import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotify/ui/widgets/custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.all(8.0),
        children: [
          const CustomDrawerHeader(),
          ListTile(
            title: const Text('home'),
            onTap: () => Get.offAndToNamed('/'),
          ),
          ListTile(
            title: const Text('tile2'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
