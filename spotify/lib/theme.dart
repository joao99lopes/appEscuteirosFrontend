import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xffd3e9ea),
  appBarTheme: const AppBarTheme(color: Color(0xff348aa7))
);

void setSize(String storageKey, String value) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  storage.write(key: storageKey, value: value);
}

void increaseSize(String storageKey) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? oldValue = await storage.read(key: storageKey);
  int newValue = int.parse(oldValue!) + 1;
  storage.delete(key: storageKey);
  storage.write(key: storageKey, value: newValue.toString());
  print("object");
  print("$oldValue - $newValue");
}

void decreaseSize(String storageKey) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? oldValue = await storage.read(key: storageKey);
  int newValue = int.parse(oldValue!) - 1;
  storage.delete(key: storageKey);
  storage.write(key: storageKey, value: newValue.toString());
  print("aaa");
  print("$oldValue - $newValue");
}

class CustomColors {
  static const color1 = Color(0xffd3e9ea);
  static const color2 = Color(0xff348aa7);
  static const color3 = Color(0xffc9fbff);

}