import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/entities/movie.dart';
import '../screens/movie_details_screen.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.mq,
    required this.movie,
  }) : super(key: key);

  final Size mq;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
              mq: mq,
              movie: movie,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
            ),
          ),
          errorWidget: (context, url, error) => ImageErrorWidget(movie: movie),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
