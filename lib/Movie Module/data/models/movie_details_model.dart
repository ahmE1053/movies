import 'package:movies/Movie%20Module/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.genres,
    required super.runTime,
    required super.posterPath,
    required super.id,
    required super.title,
    required super.backgroundPath,
    required super.overview,
    required super.voteAverage,
    required super.genreIds,
    required super.releaseDate,
  });

  factory MovieDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final runTime =
        Duration(minutes: json['runtime'] ?? 0).toString().split(':');
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'] ?? 'no title found',
      backgroundPath: json['backdrop_path'] ?? json['poster_path'] ?? '',
      overview: json['overview'] ?? '??',
      voteAverage: (json['vote_average'] is int
              ? (json['vote_average'] as int).toDouble()
              : json['vote_average']) ??
          0,
      genreIds: (json['genres'] as List).map((e) => (e['id'] as int)).toList(),
      releaseDate: json['release_date'] ?? '0000-0-0',
      posterPath: json['poster_path'] ?? '',
      genres:
          (json['genres'] as List).map((e) => (e['name'] as String)).toList(),
      runTime: runTime,
    );
  }
}
