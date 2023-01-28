import 'package:get/get.dart';
import 'package:spotify/ui/screen/add_song_screen/add_song_controller.dart';
import 'package:spotify/ui/screen/list_songs/list_songs_controller.dart';
import 'package:spotify/ui/screen/show_song/show_song_controller.dart';

import '../screen/playlists/playlists_controller.dart';

class ListSongsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListSongsController(), fenix: true);
  }
}

class PlaylistsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlaylistsController(), fenix: true);
  }
}

class ShowSongBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowSongController());
  }
}

class AddSongBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddSongController());
  }
}
