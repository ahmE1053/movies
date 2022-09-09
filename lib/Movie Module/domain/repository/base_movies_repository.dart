import 'package:dartz/dartz.dart';
import 'package:movies/Movie%20Module/domain/entities/movie_details.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<List<Movie>> getMovieRecommendations(String movieId);

  Future<MovieDetails> getMovieDetails(String movieId);
}
