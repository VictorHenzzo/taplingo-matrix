import 'package:injectable/injectable.dart';
import 'package:taplingo_matrix/core/domain/songs.dart';
import 'package:taplingo_matrix/core/ports/input/fetch_song_list_input_port.dart';
import 'package:taplingo_matrix/core/ports/output/fetch_song_list_output_port.dart';

@singleton
class FetchSongListUseCase implements FetchSongListInputPort {
  const FetchSongListUseCase(this._outputPort);

  final FetchSongListOutputPort _outputPort;

  @override
  Stream<SongList> fetchSongList(String song) {
    return _outputPort.fetchSongList(song);
  }
}
