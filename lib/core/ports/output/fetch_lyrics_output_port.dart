import 'package:taplingo_matrix/core/domain/lyrics.dart';

abstract class FetchLyricsOutputPort {
  Stream<Lyrics> fetchLyrics(String apiLyrics);
}
