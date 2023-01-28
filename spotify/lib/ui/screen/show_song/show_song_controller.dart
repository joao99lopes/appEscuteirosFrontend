import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../data/model/song.dart';
import '../../../data/model/song_with_text_on_title_request.dart';
import '../../../domain/service/songs_service.dart';
import '../../../theme.dart';

class ShowSongController extends GetxController {
  final String? title = Get.parameters['title'];
  Song? song;
  final isLoading = true.obs;
  final isOverlayOpen = false.obs;
  int lyricsFontSize = 20;
  // final Rxn<String> lyricsFontSize = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    Get.put(SongService());
    getSongByTitle();
    setLyricsFontSize();
  }

  Future<void> getSongByTitle() async {
    SongService service = Get.find();
    song = await service.getSongsWithTitle(SongWithTextOnTitleRequest(title!));
    update();
  }

  void setLyricsFontSize() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? tmpLyricsFontSize = await storage.read(key: 'lyricsFontSize');
    if (tmpLyricsFontSize == null) {
      storage.write(key: 'lyricsFontSize', value: '20');
    } else {
      lyricsFontSize = int.parse(tmpLyricsFontSize);
    }
  }

  void increaseFontSize() async {
    lyricsFontSize++;
    update();
    increaseSize("lyricsFontSize");
  }

  void decreaseFontSize() async {
    lyricsFontSize--;
    update();
    decreaseSize("lyricsFontSize");
  }

  void openOverlay() {
    isOverlayOpen.value = true;
    update();
  }

  void closeOverlay() {
    isOverlayOpen.value = false;
    update();
  }

}
