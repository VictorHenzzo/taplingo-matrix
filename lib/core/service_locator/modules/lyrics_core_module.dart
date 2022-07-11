import 'package:injectable/injectable.dart';
import 'package:taplingo_matrix/core/ports/input/fetch_lyrics_input_port.dart';
import 'package:taplingo_matrix/core/ports/output/fetch_lyrics_output_port.dart';
import 'package:taplingo_matrix/core/repository/lyrics_repository.dart';
import 'package:taplingo_matrix/core/usecase/fetch_lyrics_use_case.dart';

@module
abstract class LyricsCoreModule {
  @singleton
  FetchLyricsInputPort fetchLyricInputPort(
    FetchLyricsUseCase useCase,
  ) =>
      useCase;

  @singleton
  FetchLyricsOutputPort fetchLyricOutputPort(
    LyricsRepository repository,
  ) =>
      repository;
}
