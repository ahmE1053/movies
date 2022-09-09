import 'package:flutter/material.dart';

import '../../Movie Module/domain/entities/movie.dart';

class MoviesCategoryProvider with ChangeNotifier {
  List<Movie> moviesList = [];

  void setMoviesList(List<Movie> list) {
    moviesList = list;
    notifyListeners();
  }
}
