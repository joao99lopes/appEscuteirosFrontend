import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          child: Center(
            child: Column(
              children: const [
                Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.person,
                      size: 40,
                    )),
                Expanded(flex: 1, child: Text('joao.aclopes99@gmail.com')),
              ],
            ),
          )
      ),
    );
  }
}
