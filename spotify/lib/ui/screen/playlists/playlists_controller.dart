import 'package:get/get.dart';

import '../../../domain/service/playlists_service.dart';

class PlaylistsController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Get.put(PlaylistsService());

  }
}