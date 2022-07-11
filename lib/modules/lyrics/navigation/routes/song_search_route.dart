import 'package:flutter/material.dart';
import 'package:taplingo_matrix/core/routes/navigation_route.dart';
import 'package:taplingo_matrix/core/routes/route_transition.dart';
import 'package:taplingo_matrix/modules/lyrics/ui/song_search_screen.dart';

class SongSearchRoute extends NavigationRoute {
  static String path = '/songSearch';

  SongSearchRoute._(Route<Object> route)
      : super(
          path,
          route,
          fullScreen: true,
        );

  static SongSearchRoute of({
    Duration? transitionDuration,
    RouteTransitionsBuilder? transitionsBuilder,
    bool animated = true,
  }) {
    SongSearchScreen _screen = SongSearchScreen(
      formKey: GlobalKey<FormState>(),
      controller: TextEditingController(),
    );

    if (animated) {
      return SongSearchRoute._(
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

    return SongSearchRoute._(
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
