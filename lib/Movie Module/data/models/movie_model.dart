import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.releaseDate,
    required super.id,
    required super.title,
    required super.backgroundPath,
    required super.overview,
    required super.voteAverage,
    required super.genreIds,
    required super.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      backgroundPath: json['backdrop_path'] ?? json['poster_path'] ?? '',
      overview: json['overview'] ?? '',
      voteAverage: (json['vote_average'] is int
              ? (json['vote_average'] as int).toDouble()
              : json['vote_average']) ??
          0,
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      releaseDate: json['release_date'] ?? 0,
      posterPath: json['poster_path'] ?? '',
    );
  }
}
