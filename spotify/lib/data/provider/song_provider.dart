import 'package:get/get.dart';
import 'package:spotify/data/model/response_base.dart';
import 'package:spotify/data/model/song_with_text_on_title_request.dart';

import '../model/add_song/add_song_request.dart';
import 'api_base.dart';

class SongProvider extends ApiBase {
  Future<List<dynamic>> getSongs() async {
    Response response = await get('song/get');
    return response.body['data'];
  }

  Future<List<dynamic>> getSongsWithTextOnTitle(SongWithTextOnTitleRequest request) async {
    Response response = await get('song/get_songs_with_title_match', query: request.toMap());
    return response.body['data'];
  }

  Future<ResponseBase> addSong(AddSongRequest request) async {
    Response response = await post('song/new', request.toMap());
    if (response.statusCode != 200) {
      print("ERRORRORORORO");
    }
    return ResponseBase(response.statusCode!);
}
}