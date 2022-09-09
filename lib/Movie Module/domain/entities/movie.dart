import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
part 'movie.g.dart';

@Collection()
class Movie extends Equatable {
  @Id()
  final int id;
  final String title, backgroundPath, overview, releaseDate, posterPath;
  final double voteAverage;
  final List<int> genreIds;

  const Movie({
    required this.posterPath,
    required this.id,
    required this.title,
    required this.backgroundPath,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
    required this.releaseDate,
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
      ];
}
