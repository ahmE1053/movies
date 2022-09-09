import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../main.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository repository = getIt.get<BaseMoviesRepository>();

  Future<Either<Failure, List<Movie>>> execute() async {
    return await repository.getTopRatedMovies();
  }
}
