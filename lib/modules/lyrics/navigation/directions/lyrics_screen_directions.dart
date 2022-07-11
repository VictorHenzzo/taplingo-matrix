import 'package:taplingo_matrix/core/directions/screen_directions.dart';
import 'package:taplingo_matrix/core/routes/app_navigator.dart';
import 'package:taplingo_matrix/modules/lyrics/ui/song_list_result_screen.dart';

class SongListResultScreenDirections extends ScreenDirection {
  SongListResultScreenDirections(
    SongListResultScreen screen,
  ) : super(screen);

  void goToSongListResults() {
    AppNavigator.pop();
  }
}
