import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:spotify/data/model/add_song/add_song_request.dart';
import 'package:spotify/domain/service/songs_service.dart';

import '../../../data/model/response_base.dart';

class AddSongController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final lyricsController = TextEditingController();
  final waitingForServer = false.obs;
  final serverError = false.obs;

  @override
  void onInit() {
    super.onInit();
    Get.put(SongService());
  }

  void addSong() async {
    SongService songService = Get.find();
    AddSongRequest request = AddSongRequest(
      titleController.value.text,
      lyricsController.value.text,
    );
    waitingForServer.value = true;
    update();
    ResponseBase response = await songService.addSong(request);
    if (response.statusCode == 200) {
      Get.offAndToNamed('/');
    } else {
      serverError.value = true;
    }
    waitingForServer.value = false;
    update();
  }
}
