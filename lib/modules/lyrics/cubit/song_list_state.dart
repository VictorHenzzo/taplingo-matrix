import 'package:equatable/equatable.dart';
import 'package:taplingo_matrix/core/domain/songs.dart';

abstract class SongListState extends Equatable {}

class InitialState extends SongListState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SongListState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends SongListState {
  LoadedState(this.songList);

  final SongList songList;

  @override
  List<Object?> get props => [songList];
}

class ErrorState extends SongListState {
  @override
  List<Object?> get props => [];
}
