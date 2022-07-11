import 'package:taplingo_matrix/core/domain/lyrics.dart';

abstract class FetchLyricsInputPort {
  Stream<Lyrics> fetchLyrics(String apiLyrics);
}
