import 'package:taplingo_matrix/core/domain/songs.dart';

abstract class FetchSongListOutputPort {
  Stream<SongList> fetchSongList(String song);
}
