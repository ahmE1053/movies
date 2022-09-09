import 'package:movies/Movie%20Module/domain/entities/movie.dart';

class MovieDetails extends Movie {
  final List<String> genres, runTime;

  const MovieDetails({
    required this.genres,
    required this.runTime,
    required super.posterPath,
    required super.id,
    required super.title,
    required super.backgroundPath,
    required super.overview,
    required super.voteAverage,
    required super.genreIds,
    required super.releaseDate,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        backgroundPath,
        overview,
        voteAverage,
        genreIds,
        genres,
        runTime,
      ];
}
