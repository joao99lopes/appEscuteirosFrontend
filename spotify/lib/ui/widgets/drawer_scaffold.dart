import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/ui/widgets/custom_drawer.dart';

class DrawerScaffold extends StatelessWidget {
  final String? title;
  final Widget child;
  final bool hasDrawer;

  const DrawerScaffold(
      {Key? key, this.title, required this.child, required this.hasDrawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title!) : null,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: hasDrawer
          ? const CustomDrawer()
          : null,
      body: child,
    );
  }
}
