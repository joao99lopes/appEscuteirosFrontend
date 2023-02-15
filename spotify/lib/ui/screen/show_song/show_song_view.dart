import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/ui/screen/list_songs/list_songs_controller.dart';
import 'package:spotify/ui/screen/show_song/show_song_controller.dart';
import 'package:spotify/ui/screen/show_song/widgets/show_song_overlay_widget.dart';

class ShowSongView extends StatelessWidget {
  const ShowSongView({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<ShowSongController>(builder: (controller) {
      if (controller.song != null) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => controller.closeOverlay(),
              child: Positioned(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.song!.lyrics!.length,
                    itemBuilder: (context, index) {
                      List<String> lyrics = controller.song!.lyrics!;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(lyrics[index],
                            style: TextStyle(fontSize: controller.lyricsFontSize.toDouble())),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              right: screenWidth * 0.05,
              bottom: screenHeight * 0.1,
              child: FloatingActionButton(
                onPressed: () => controller.openOverlay(),
                elevation: 10,
                heroTag: "editView",
                child: const Icon(Icons.list, size: 30),
              ),
            ),
            Positioned(
              right: screenWidth * 0.05,
              bottom: screenHeight * 0.1,
              child: Visibility(
                  visible: controller.isOverlayOpen.value,
                  child: ShowSongOverlay(
                    controller: controller,
                  )),
            ),
          ],
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
