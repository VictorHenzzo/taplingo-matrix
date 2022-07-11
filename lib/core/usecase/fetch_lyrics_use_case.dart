import 'package:injectable/injectable.dart';
import 'package:taplingo_matrix/core/domain/lyrics.dart';
import 'package:taplingo_matrix/core/ports/input/fetch_lyrics_input_port.dart';
import 'package:taplingo_matrix/core/ports/output/fetch_lyrics_output_port.dart';

@singleton
class FetchLyricsUseCase implements FetchLyricsInputPort {
  const FetchLyricsUseCase(this._outputPort);

  final FetchLyricsOutputPort _outputPort;

  @override
  Stream<Lyrics> fetchLyrics(String song) {
    return _outputPort.fetchLyrics(song);
  }
}
