import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:movies/Movie%20Module/domain/use cases/get_now_playing_movies_use_case.dart';
import 'package:movies/Movie%20Module/domain/use cases/get_popular_movies_use_case.dart';

import '../../Movie Module/domain/entities/movie.dart';
import '../../Movie Module/domain/use cases/get_top_rated_movies_use_case.dart';
import '../../main.dart';

class MainProvider with ChangeNotifier {
  List<Movie> nowPlayingMoviesList = [];
  List<Movie> topRatedMoviesList = [];
  List<Movie> popularMoviesList = [];

  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase =
      getIt.get<GetTopRatedMoviesUseCase>();

  GetPopularMoviesUseCase getPopularMoviesUseCase =
      getIt.get<GetPopularMoviesUseCase>();

  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase =
      getIt.get<GetNowPlayingMoviesUseCase>();

  Future<void> setNowPlayingMoviesList() async {
    (await getNowPlayingMoviesUseCase.execute()).fold(
      (l) => nowPlayingMoviesList = [],
      (r) => nowPlayingMoviesList = r,
    );
  }

  Future<void> setTopRatedMoviesList() async {
    (await getTopRatedMoviesUseCase.execute()).fold(
      (l) => topRatedMoviesList = [],
      (r) => topRatedMoviesList = r,
    );
  }

  Future<void> setPopularMoviesList() async {
    (await getPopularMoviesUseCase.execute()).fold(
      (l) => popularMoviesList = [],
      (r) => popularMoviesList = r,
    );
  }

  Future<void> initialize() async {
    await setNowPlayingMoviesList();
    await setPopularMoviesList();
    await setTopRatedMoviesList();
  }
}
