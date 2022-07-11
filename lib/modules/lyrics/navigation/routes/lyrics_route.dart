import 'package:flutter/material.dart';
import 'package:taplingo_matrix/core/routes/navigation_route.dart';
import 'package:taplingo_matrix/core/routes/route_transition.dart';
import 'package:taplingo_matrix/core/service_locator/service_locator_config.dart';
import 'package:taplingo_matrix/modules/lyrics/ui/lyrics_screen.dart';

class LyricsRoute extends NavigationRoute {
  static String path = '/lyrics';

  LyricsRoute._(Route<Object> route)
      : super(
          path,
          route,
          fullScreen: true,
        );

  static LyricsRoute of({
    required String apiLyrics,
    Duration? transitionDuration,
    RouteTransitionsBuilder? transitionsBuilder,
    bool animated = true,
  }) {
    LyricsScreen _screen = LyricsScreen(
      fetchLyricsInputPort: ServiceLocatorConfig.provide(),
      apiLyrics: apiLyrics,
    );

    if (animated) {
      return LyricsRoute._(
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

    return LyricsRoute._(
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
