import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/movie.dart';

abstract class BaseMovieLocalDatasource {
  Future<List<Movie>> getNowPlayingMoviesLocal();
  Future<List<Movie>> getPopularRatedMoviesLocal();
  Future<List<Movie>> getTopRatedMoviesLocal();
}

class MovieLocalDatasource extends BaseMovieLocalDatasource {
  @override
  Future<List<Movie>> getNowPlayingMoviesLocal() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final isar = await Isar.open(
      schemas: [MovieSchema],
      name: 'nowPlaying',
      directory: path,
    );

    final movies = (await isar.movies.where().findAll());
    print('nowPlaying $movies');
    await isar.close();
    return movies;
  }

  @override
  Future<List<Movie>> getPopularRatedMoviesLocal() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final isar = await Isar.open(
      schemas: [MovieSchema],
      name: 'popularMovies',
      directory: path,
    );
    final movies = (await isar.movies.where().findAll());
    print('popularMovies $movies');

    await isar.close();
    return movies;
  }

  @override
  Future<List<Movie>> getTopRatedMoviesLocal() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final isar = await Isar.open(
      schemas: [MovieSchema],
      name: 'topRated',
      directory: path,
    );
    final movies = (await isar.movies.where().findAll());

    await isar.close();
    return movies;
  }
}
