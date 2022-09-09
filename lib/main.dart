import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:movies/Movie%20Module/data/data%20source/movie_details_remote_datasource.dart';
import 'package:movies/Movie%20Module/data/data%20source/movie_remote_datasource.dart';
import 'package:movies/Movie%20Module/data/data%20source/movies_local_datasource.dart';
import 'package:movies/Movie%20Module/domain/entities/movie.dart';
import 'package:movies/Movie%20Module/domain/repository/base_movies_repository.dart';
import 'package:movies/Movie%20Module/domain/use cases/get_movie_details_use_case.dart';
import 'package:movies/Movie%20Module/domain/use cases/get_movie_recommendations_use_case.dart';
import 'package:movies/Movie%20Module/domain/use cases/get_now_playing_movies_use_case.dart';
import 'package:movies/Movie%20Module/domain/use cases/get_popular_movies_use_case.dart';
import 'package:movies/Movie%20Module/domain/use cases/get_top_rated_movies_use_case.dart';
import 'package:movies/Movie%20Module/presentation/trying/screens/main_screen.dart';
import 'package:movies/Movie%20Module/presentation/trying/screens/splash_screen.dart';
import 'package:movies/core/providers/main_provider.dart';
import 'package:movies/core/providers/movies_category_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'Movie Module/data/repository/movie_repository.dart';
import 'core/providers/movies_details.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MovieRemoteDatasource());

  getIt.registerLazySingleton<MovieDetailsProvider>(
      () => MovieDetailsProvider());

  getIt.registerLazySingleton<BaseMovieDetailsRemoteDatasource>(
      () => MovieDetailsRemoteDatasource());

  getIt.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository());

  getIt.registerLazySingleton<GetNowPlayingMoviesUseCase>(
      () => GetNowPlayingMoviesUseCase());

  getIt.registerLazySingleton<GetMovieRecommendationsUseCase>(
      () => GetMovieRecommendationsUseCase());

  getIt.registerLazySingleton<GetMovieDetailsUseCase>(
      () => GetMovieDetailsUseCase());

  getIt.registerLazySingleton<GetTopRatedMoviesUseCase>(
      () => GetTopRatedMoviesUseCase());

  getIt.registerLazySingleton<GetPopularMoviesUseCase>(
      () => GetPopularMoviesUseCase());

  getIt.registerLazySingleton<BaseMovieLocalDatasource>(
      () => MovieLocalDatasource());

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MoviesCategoryProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (_) => const SplashScreen(),
          MainScreen.id: (_) => const MainScreen(),
        },
      ),
    );
  }
}
