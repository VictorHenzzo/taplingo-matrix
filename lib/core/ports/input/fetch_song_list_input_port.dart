import 'package:taplingo_matrix/core/domain/songs.dart';

abstract class FetchSongListInputPort {
  Stream<SongList> fetchSongList(String song);
}
