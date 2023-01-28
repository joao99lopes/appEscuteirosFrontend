import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:spotify/theme.dart';

import '../../../data/model/song.dart';
import '../../../domain/service/songs_service.dart';

class ListSongsController extends GetxController {
  List<String> categories = [
    'entrada',
    'kyrie',
    'aclamação',
    'santo',
    'cordeiro',
    'pai nosso',
    'comunhão',
    'ação de graças',
    'final'
  ];
  List<String> selectedCategories = [];

  List<String> sortingOptions = [
    'Most Viewed',
    'Latest',
    'Oldest',
    'Alphabetically',
  ];

  List<Song> songs = [];
  List<Song> filteredSongs = [];
  String sortBy = 'Oldest';
  final isChanged = false.obs;
  final isOverlayOpen = false.obs;

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(()=> SongService(), fenix: true);
    getSongs();
  }

  Future<void> getSongs() async {
    SongService service = Get.find();
    songs = await service.getSongs();
    sortSongs();
    print(songs.length);
  }

  void setSortBy(String option) {
    sortBy = option;
    sortSongs();
  }

  void sortSongs() {
    filteredSongs = songs;
    switch (sortBy) {
      case 'Most Viewed':
        filteredSongs.sort((a, b) => a.accesses.compareTo(b.accesses));
        break;
      case 'Oldest':
        filteredSongs.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case 'Latest':
        filteredSongs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'Alphabetically':
        filteredSongs.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      default:
        filteredSongs.sort((a, b) => a.title.compareTo(b.title));
    }
    update();
  }

  void onSongSelected(Song song)
  {
    if (isOverlayOpen.value) {
      toggleOverlay();
      return;
    }
    String title = song.title.replaceAll(RegExp(' '), '+');
    Get.toNamed("/song/$title");
  }

  void openOverlay() {
    isOverlayOpen.value = true;
    update();
  }

  void closeOverlay() {
    isOverlayOpen.value = false;
    update();
  }

  void toggleOverlay() {
    isOverlayOpen.toggle();
    update();
  }

}
