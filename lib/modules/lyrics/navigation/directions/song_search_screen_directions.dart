import 'package:taplingo_matrix/core/directions/screen_directions.dart';
import 'package:taplingo_matrix/core/routes/app_navigator.dart';
import 'package:taplingo_matrix/modules/lyrics/navigation/routes/song_list_result_route.dart';
import 'package:taplingo_matrix/modules/lyrics/ui/song_search_screen.dart';

class SongSearchScreenDirections extends ScreenDirection {
  SongSearchScreenDirections(
    SongSearchScreen screen,
  ) : super(screen);

  void goToResult(String song) {
    AppNavigator.push(SongListResultRoute.of(song: song));
  }
}
