import 'package:get/get.dart';

import '../../data/provider/playlists_provider.dart';

class PlaylistsService extends GetxService {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Get.put(PlaylistsProvider());
  }
}