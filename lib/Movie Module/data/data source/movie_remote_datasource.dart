import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/utils/constants.dart';
import '../models/movie_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getMovieRecommendations(String movieId);
}

class MovieRemoteDatasource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      AppConstants.getNowPlayingMoviesUrl,
    );
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map(
            (e) => MovieModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstants.getPopularMoviesUrl);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map(
            (e) => MovieModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstants.getTopRatedMoviesUrl);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map(
            (e) => MovieModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(String movieId) async {
    final response = await Dio().get(
      AppConstants.getMovieRecommendations(
        movieId,
      ),
    );

    return (response.data['results'] as List)
        .map(
          (e) => MovieModel.fromJson(
            e,
          ),
        )
        .toList();
  }
}
