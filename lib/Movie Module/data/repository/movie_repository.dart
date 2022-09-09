import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import 'package:movies/Movie%20Module/data/data%20source/movies_local_datasource.dart';
import 'package:path_provider/path_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../../main.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../data source/movie_details_remote_datasource.dart';
import '../data source/movie_remote_datasource.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
      getIt.get<BaseMoviesRemoteDataSource>();
  final BaseMovieDetailsRemoteDatasource baseMovieDetailsRemoteDatasource =
      getIt.get<BaseMovieDetailsRemoteDatasource>();
  final BaseMovieLocalDatasource baseMovieLocalDatasource =
      getIt.get<BaseMovieLocalDatasource>();

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    var connectivityResult = (await Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      try {
        final listOfMovies =
            await baseMoviesRemoteDataSource.getNowPlayingMovies();
        final path = await getApplicationDocumentsDirectory();
        final isar = await Isar.open(
          schemas: [MovieSchema],
          name: 'nowPlaying',
          directory: path.path,
        );
        await isar.writeTxn(
          (isar) async {
            final moviesDb = isar.movies;
            await moviesDb.clear();
            print('list of movies $listOfMovies');
            await moviesDb.putAll(listOfMovies);
          },
        );
        await isar.close();
        return Right(listOfMovies);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      final listOfMovies =
          await baseMovieLocalDatasource.getNowPlayingMoviesLocal();
      return Right(listOfMovies);
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final listOfMovies =
            await baseMoviesRemoteDataSource.getPopularMovies();
        final path = await getApplicationDocumentsDirectory();
        final isar = await Isar.open(
          schemas: [MovieSchema],
          name: 'popularMovies',
          directory: path.path,
        );
        await isar.writeTxn(
          (isar) async {
            final moviesDb = isar.movies;
            await moviesDb.clear();
            await moviesDb.putAll(listOfMovies);
          },
        );
        await isar.close();
        return Right(listOfMovies);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      final listOfMovies =
          await baseMovieLocalDatasource.getPopularRatedMoviesLocal();
      return Right(listOfMovies);
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final listOfMovies =
            await baseMoviesRemoteDataSource.getTopRatedMovies();
        final path = await getApplicationDocumentsDirectory();
        final isar = await Isar.open(
          schemas: [MovieSchema],
          name: 'topRated',
          directory: path.path,
        );
        await isar.writeTxn(
          (isar) async {
            final moviesDb = isar.movies;
            await moviesDb.clear();
            await moviesDb.putAll(listOfMovies);
          },
        );
        log(List<Movie>.from(await isar.movies.where().findAll()).toString());
        await isar.close();
        return Right(listOfMovies);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      final listOfMovies =
          await baseMovieLocalDatasource.getTopRatedMoviesLocal();
      return Right(listOfMovies);
    }
  }

  @override
  Future<List<Movie>> getMovieRecommendations(String movieId) async {
    final listOfMovies =
        await baseMoviesRemoteDataSource.getMovieRecommendations(movieId);
    return listOfMovies;
  }

  @override
  Future<MovieDetails> getMovieDetails(String movieId) async {
    return await baseMovieDetailsRemoteDatasource.getMovieDetails(movieId);
  }
}
