import 'package:movies/Movie%20Module/domain/entities/movie_details.dart';
import 'package:movies/Movie%20Module/domain/use%20cases/get_movie_details_use_case.dart';
import 'package:movies/Movie%20Module/domain/use%20cases/get_movie_recommendations_use_case.dart';
import 'package:movies/main.dart';

import '../../Movie Module/domain/entities/movie.dart';

class MovieDetailsProvider {
  final GetMovieRecommendationsUseCase getMovieRecommendationsUseCase =
      getIt.get<GetMovieRecommendationsUseCase>();
  final GetMovieDetailsUseCase getMovieDetailsUseCase =
      getIt.get<GetMovieDetailsUseCase>();
  MovieDetails movieDetails = const MovieDetails(
    genres: [],
    releaseDate: '',
    title: '',
    backgroundPath: '',
    genreIds: [],
    id: 0,
    overview: '',
    posterPath: '',
    runTime: [],
    voteAverage: 1,
  );

  List<Movie> recommendedMovies = [];

  Future<void> initialize(String movieId) async {
    try {
      movieDetails = await getMovieDetailsUseCase(movieId);
      print(movieDetails);
    } catch (e) {
      print(e);
    }
    recommendedMovies = await getMovieRecommendationsUseCase(movieId);
  }
}
