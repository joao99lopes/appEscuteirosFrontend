import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:spotify/ui/screen/list_songs/list_songs_screen.dart';

import '../navigation/bindings.dart';
import '../screen/add_song_screen/add_song_screen.dart';
import '../screen/playlists/playlists_screen.dart';
import '../screen/settings/settings_screen.dart';
import '../screen/show_song/show_song_screen.dart';

List<GetPage> get pages => [
  // GetPage(
  //   name: '/login',
  //   page: () => const LoginScreen(),
  //   binding: LoginBindings(),
  // ),
  GetPage(
    name: '/',
    page: () => const ListSongsScreen(),
    binding: ListSongsBindings(),
  ),
  GetPage(
    name: '/playlists',
    page: () => const PlaylistsScreen(),
    binding: PlaylistsBindings(),
  ),
  GetPage(
    name: '/settings',
    page: () => const SettingsScreen(),
    transition: Transition.size
  ),
  GetPage(
    name: '/song/:title',
    page: () => const ShowSongScreen(),
    binding: ShowSongBindings(),
  ),
  GetPage(
    name: '/add-song',
    page: () => const AddSongScreen(),
    binding: AddSongBindings(),
  ),
];
