import 'package:flutter/material.dart';
import 'package:taplingo_matrix/core/routes/navigation_route.dart';
import 'package:taplingo_matrix/core/routes/route_transition.dart';
import 'package:taplingo_matrix/core/service_locator/service_locator_config.dart';
import 'package:taplingo_matrix/modules/lyrics/ui/song_list_result_screen.dart';

class SongListResultRoute extends NavigationRoute {
  static String path = '/songListResult';

  SongListResultRoute._(Route<Object> route)
      : super(
          path,
          route,
          fullScreen: true,
        );

  static SongListResultRoute of({
    required String song,
    Duration? transitionDuration,
    RouteTransitionsBuilder? transitionsBuilder,
    bool animated = true,
  }) {
    SongListResultScreen _screen = SongListResultScreen(
      searchSong: song,
      fetchSoundListInputPort: ServiceLocatorConfig.provide(),
    );

    if (animated) {
      return SongListResultRoute._(
        PageRouteBuilder(
          settings: RouteSettings(name: path),
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              _screen,
          transitionDuration:
              transitionDuration ?? RouteTransitions.DEFAULT_DURATION,
          transitionsBuilder:
              transitionsBuilder ?? RouteTransitions.DEFAULT_TRANSITION,
        ),
      );
    }

    return SongListResultRoute._(
      PageRouteBuilder(
        settings: RouteSettings(name: path),
        pageBuilder: (
          context,
          animation,
          secondaryAnimation,
        ) =>
            _screen,
      ),
    );
  }
}
