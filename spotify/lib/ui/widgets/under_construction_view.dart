import 'package:flutter/cupertino.dart';

class UnderConstructionView extends StatelessWidget {
  const UnderConstructionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.network("https://media.giphy.com/media/WrgQBXlUPBw3Ar73xG/giphy.gif"),
    );
  }
}
