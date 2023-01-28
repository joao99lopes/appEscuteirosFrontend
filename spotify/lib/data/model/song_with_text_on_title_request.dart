class SongWithTextOnTitleRequest {
  final String _text;

  SongWithTextOnTitleRequest(
      this._text
      );

  Map<String, String> toMap() => {
    "text": _text
  };

  String get text => _text;
}