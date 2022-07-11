class SongList {
  int? length;
  List<Song> list = [];

  SongList.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    if (json['result'] != null) {
      json['result'].forEach((v) {
        list.add(Song.fromJson(v));
      });
    }
  }
}

class Song {
  String? track;
  String? artist;
  String? album;
  String? lang;
  String? cover;
  String? apiLyrics;

  Song.fromJson(Map<String, dynamic> json) {
    artist = json['artist'];
    track = json['track'];
    album = json['album'];
    lang = json['lang'];
    cover = json['cover'];
    apiLyrics = json['api_lyrics'];
  }
}
