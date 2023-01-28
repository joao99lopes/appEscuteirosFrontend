import 'dart:io';

class Song {
  final int _id;
  final String _title;
  List<String>? _lyrics;
  final int _creatorId;
  final int _accesses;
  final DateTime _createdAt;

  Song(
      this._id,
      this._title,
      this._creatorId,
      this._accesses,
      this._createdAt
      );

  factory Song.fromJson(json) => Song(
    json['id'],
    json['title'],
    json['creator_id'],
    json['accesses'].length,
    HttpDate.parse(json['created_at'])
  );

  int get id => _id;
  String get title => _title;
  int get creatorId => _creatorId;
  int get accesses => _accesses;
  List<String>? get lyrics => _lyrics;
  DateTime get createdAt => _createdAt;

  set lyrics(List<String>? newLyrics) {
    _lyrics = newLyrics;
  }

  void setLyrics(List<dynamic> newLyrics) {
    lyrics = (newLyrics).map((item) => item as String).toList();
  }

}