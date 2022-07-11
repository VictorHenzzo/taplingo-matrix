import 'package:injectable/injectable.dart';
import 'package:taplingo_matrix/core/ports/input/fetch_song_list_input_port.dart';
import 'package:taplingo_matrix/core/ports/output/fetch_song_list_output_port.dart';
import 'package:taplingo_matrix/core/repository/song_list_repository.dart';
import 'package:taplingo_matrix/core/usecase/fetch_song_list_use_case.dart';

@module
abstract class SongListCoreModule {
  @singleton
  FetchSongListInputPort fetchSongListInputPort(
    FetchSongListUseCase useCase,
  ) =>
      useCase;

  @singleton
  FetchSongListOutputPort fetchSongListOutputPort(
    SongListRepository repository,
  ) =>
      repository;
}
