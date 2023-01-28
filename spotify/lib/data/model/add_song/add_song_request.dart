class AddSongRequest {
  final String _title;
  final String _lyrics;

  AddSongRequest(this._title, this._lyrics);

  String get title => _title;
  String get lyrics => _lyrics;

  Map<String, String> toMap() => {
        'title': title,
        'lyrics': lyrics,
      };
}
