import 'package:dio/dio.dart';
import 'package:movies/Movie%20Module/data/models/movie_details_model.dart';
import 'package:movies/core/utils/constants.dart';

import '../../domain/entities/movie_details.dart';

abstract class BaseMovieDetailsRemoteDatasource {
  Future<MovieDetails> getMovieDetails(String movieId);
}

class MovieDetailsRemoteDatasource extends BaseMovieDetailsRemoteDatasource {
  @override
  Future<MovieDetails> getMovieDetails(String movieId) async {
    final response = await Dio().get(AppConstants.getMovieDetails(movieId));
    return MovieDetailsModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
