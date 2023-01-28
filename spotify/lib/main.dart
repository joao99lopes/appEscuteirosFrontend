import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/theme.dart';
import 'package:spotify/ui/navigation/pages.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: "/",
    getPages: pages,
    theme: customTheme,
  ));
}
