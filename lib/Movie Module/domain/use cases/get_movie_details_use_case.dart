import 'package:movies/Movie%20Module/domain/entities/movie_details.dart';
import 'package:movies/Movie%20Module/domain/repository/base_movies_repository.dart';

import '../../../main.dart';

class GetMovieDetailsUseCase {
  final BaseMoviesRepository baseMoviesRepository =
      getIt.get<BaseMoviesRepository>();

  Future<MovieDetails> call(String movieId) async {
    return await baseMoviesRepository.getMovieDetails(movieId);
  }
}
