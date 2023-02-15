import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spotify/ui/screen/list_songs/list_songs_controller.dart';
import 'package:spotify/ui/screen/show_song/show_song_controller.dart';

import '../../../../theme.dart';

class FilterListSongsOverlay extends StatelessWidget {
  final ListSongsController controller;
  final ScrollController scrollController;

  const FilterListSongsOverlay(
      {required this.controller, required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    FlutterSecureStorage storage = const FlutterSecureStorage();

    List<DropdownMenuItem<String>>? dropdownSortOptions = List.generate(
      controller.sortingOptions.length,
      (index) => DropdownMenuItem(
        value: controller.sortingOptions[index],
        child: Text(
          controller.sortingOptions[index],
          style: controller.sortBy == controller.sortingOptions[index]
              ? const TextStyle(fontWeight: FontWeight.bold)
              : null,
        ),
      ),
    );

    return Material(
      elevation: 30,
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(30),
        width: screenWidth * 0.9,
        height: screenHeight * 0.3,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: CustomColors.color1),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text("Sort By:"),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    child: DropdownButton<String>(
                      elevation: 4,
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      onChanged: (value) {
                        controller.setSortBy(value!);
                        scrollController.animateTo(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                        controller.closeOverlay();
                      },
                      items: dropdownSortOptions,
                      hint: Text(controller.sortBy),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: CustomColors.color2,
              thickness: 1,
            ),
            const Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Categories:"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
