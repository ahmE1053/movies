import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_details.dart';
import 'movie_item_widget.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    Key? key,
    required this.movie,
    required this.mq,
    this.recommendedMoviesList,
    this.movieDetails,
    required this.isLoading,
  }) : super(key: key);

  final Movie movie;
  final Size mq;
  final bool isLoading;
  final List<Movie>? recommendedMoviesList;
  final MovieDetails? movieDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          movie.title,
          style: TextStyle(
            fontSize: mq.width * 0.07,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                (DateTime.tryParse(movie.releaseDate) ?? DateTime(0))
                    .year
                    .toString(),
                style: TextStyle(
                  fontSize: mq.width * 0.05,
                ),
              ),
            ),
            const SizedBox(width: 30),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: mq.width * 0.05,
            ),
            const SizedBox(width: 5),
            Text(
              movie.voteAverage.toStringAsFixed(1),
              style: TextStyle(
                fontSize: mq.width * 0.05,
              ),
            ),
            const SizedBox(width: 30),
            isLoading
                ? SizedBox(
                    height: 20,
                    width: mq.width * 0.07,
                    child: Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  )
                : Text(
                    '${movieDetails!.runTime[0]}h ${movieDetails!.runTime[1]}m'),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          movie.overview,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: mq.width * 0.04,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(height: 10),
        isLoading
            ? SizedBox(
                height: mq.height * 0.02,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        'Genres',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: const Color(0xff1E1E29),
                      child: Container(
                        width: 50,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              )
            : movieDetails!.genres.isNotEmpty
                ? SizedBox(
                    height: mq.height * 0.02,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        (('Genres: ${movieDetails!.genres}')
                            .replaceAll(RegExp(r'([\[\]\(\)])'), '')),
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  )
                : Container(),
        const SizedBox(height: 20),
        Text(
          'MORE LIKE THIS',
          style: TextStyle(
            fontSize: mq.width * 0.07,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: isLoading
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 3,
                    mainAxisExtent: mq.height * 0.2,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: const Color(0xff1E1E29),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  },
                )
              : recommendedMoviesList!.isEmpty
                  ? const FittedBox(
                      child: Text("We can't find any movies like this one..."),
                    )
                  : GridView.builder(
                      itemBuilder: (context, index) => MovieItem(
                        mq: mq,
                        movie: recommendedMoviesList![index],
                      ),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        crossAxisCount: 3,
                        mainAxisExtent: mq.height * 0.2,
                      ),
                    ),
        ),
      ],
    );
  }
}
