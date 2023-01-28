import 'package:get/get.dart';
import 'package:spotify/data/model/add_song/add_song_request.dart';
import 'package:spotify/data/model/response_base.dart';

import '../../data/model/song.dart';
import '../../data/model/song_with_text_on_title_request.dart';
import '../../data/provider/song_provider.dart';

class SongService extends GetxService {

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => SongProvider(), fenix: true);
  }

  Future<List<Song>> getSongs() async {
    SongProvider provider = Get.find();
    List<Song> res = [];
    List<dynamic> response = await provider.getSongs();
    for (int i = 0; i < response.length; i++) {
      res.add(Song.fromJson(response[i]));
    }
    return res;
  }

  Future<List<Song>> getSongsWithTextOnTitle(SongWithTextOnTitleRequest request) async {
    SongProvider provider = Get.find();
    List<Song> res = [];
    List<dynamic> response = await provider.getSongsWithTextOnTitle(request);
    for (int i = 0; i < response.length; i++) {
      res.add(Song.fromJson(response[i]));
    }
    return res;
  }

  Future<Song> getSongsWithTitle(SongWithTextOnTitleRequest request) async {
    SongProvider provider = Get.find();
    Song res;
    List<dynamic> response = await provider.getSongsWithTextOnTitle(request);
    res = Song.fromJson(response[0]);
    res.setLyrics(response[0]['lyrics']);
    return res;
  }

  Future<ResponseBase> addSong(AddSongRequest request) async {
    SongProvider provider = Get.find();
    ResponseBase response = await provider.addSong(request);
    return response;
  }
}