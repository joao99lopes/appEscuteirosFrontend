import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/ui/screen/list_songs/list_songs_controller.dart';
import 'package:spotify/ui/screen/list_songs/widgets/filter_song_overlay_widget.dart';
import 'package:spotify/ui/screen/list_songs/widgets/list_songs_tile_widget.dart';

class ListSongsView extends StatelessWidget {
  const ListSongsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<ListSongsController>(builder: (controller) {
      List<DropdownMenuItem<String>>? dropdownCategories = List.generate(
        controller.categories.length,
        (index) => DropdownMenuItem(
          value: controller.categories[index],
          child: Text(
            controller.categories[index],
            style: controller.sortBy == controller.categories[index]
                ? const TextStyle(fontWeight: FontWeight.bold)
                : null,
          ),
        ),
      );

      ScrollController scrollController = ScrollController();

      return RefreshIndicator(
        child: Stack(
          children: [
            Positioned(
              child: SizedBox(
                height: 150 * controller.filteredSongs.length.toDouble(),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    controller: scrollController,
                    itemCount: controller.filteredSongs.length,
                    itemBuilder: (context, index) => ListSongsTileWidget(
                        controller: controller, index: index)),
              ),
            ),
            Positioned(
                right: screenWidth * 0.01,
                bottom: screenHeight * 0.05 + 70,
                child: FloatingActionButton(
                  mini: true,
                  onPressed: () => controller.toggleOverlay(),
                  elevation: 10,
                  heroTag: "filter",
                  child: const Icon(Icons.filter_alt),
                ),
            ),
            Positioned(
                right: screenWidth * 0.01,
                bottom: screenHeight * 0.05,
                child: FloatingActionButton(
                  onPressed: () {},
                  elevation: 10,
                  heroTag: "search",
                  child: const Icon(Icons.search, size: 30),
                ),
            ),
            Positioned(
              right: screenWidth * 0.05,
              bottom: screenHeight * 0.1,
              child: Visibility(
                  visible: controller.isOverlayOpen.value,
                  child: FilterListSongsOverlay(
                    controller: controller,
                    scrollController: scrollController
                  )),
            ),
          ],
        ),
        onRefresh: () => controller.getSongs(),
      );
    });
  }
}
