class Lyrics {
  String? artist;
  String? track;
  String? album;
  String? lyrics;
  String? lang;

  Lyrics();

  Lyrics.fromJson(Map<String, dynamic> json) {
    artist = json['result']['artist'];
    track = json['result']['track'];
    album = json['result']['album'];
    lyrics = json['result']['lyrics'];
    lang = json['result']['lang'];
  }
}
