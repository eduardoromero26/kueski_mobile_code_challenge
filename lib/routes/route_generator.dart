import 'package:flutter/material.dart';
import 'package:kueski_mobile_code_challenge/presentation/screens/movie_details_screen.dart';
import 'package:kueski_mobile_code_challenge/utils/route_screen_names.dart';

import '../presentation/screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteScreenNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteScreenNames.details:
        final movieId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => MovieDetailsScreen(selectedMovieId: movieId));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}