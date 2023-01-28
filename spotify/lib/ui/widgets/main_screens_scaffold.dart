import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MainScreensScaffold extends StatelessWidget {
  const MainScreensScaffold({required this.title, required this.child, required this.index,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int i) {
          if (i == 0 && index != i) {
            Get.toNamed("/playlists");
          } else if (i == 1 && index != i) {
            Get.toNamed("/", );
          } else if (i == 2 && index != i) {
            Get.offAndToNamed("/settings");
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "playlists"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "settings"),
        ],
      ),
      body: child,
    );
  }
}
