import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({required this.title, required this.icon, Key? key}) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () => Get.toNamed("add-song"),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Icon(icon),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
