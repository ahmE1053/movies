import 'package:movies/Movie%20Module/domain/repository/base_movies_repository.dart';
import 'package:movies/main.dart';

import '../entities/movie.dart';

class GetMovieRecommendationsUseCase {
  final BaseMoviesRepository baseMoviesRepository =
      getIt.get<BaseMoviesRepository>();

  Future<List<Movie>> call(String movieId) async {
    return await baseMoviesRepository.getMovieRecommendations(movieId);
  }
}
