import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/Movie%20Module/presentation/trying/screens/movie_details_screen.dart';
import 'package:movies/core/providers/main_provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/entities/movie.dart';

class CarouselForNowPlayingWidget extends StatelessWidget {
  const CarouselForNowPlayingWidget(
      {Key? key, required this.mainProvider, required this.mq})
      : super(key: key);
  final MainProvider mainProvider;
  final Size mq;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: mainProvider.nowPlayingMoviesList
          .map(
            (e) => GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailsScreen(mq: mq, movie: e),
                ),
              ),
              child: NowPlayingWidget(movie: e, mq: mq),
            ),
          )
          .toList(),
      options: CarouselOptions(
          autoPlay: true, height: mq.height * 0.5, viewportFraction: 1),
    );
  }
}

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({Key? key, required this.movie, required this.mq})
      : super(key: key);
  final Movie movie;
  final Size mq;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl:
                'https://image.tmdb.org/t/p/original/${movie.backgroundPath}',
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container(
                color: Colors.white,
              ),
            ),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          height: mq.height * 0.4,
          bottom: 0,
          width: mq.width,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF424242),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0, 0.3],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🔴',
                    style:
                        TextStyle(color: Colors.red, fontSize: mq.width * 0.05),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Now Playing',
                    style: TextStyle(
                        fontSize: mq.width * 0.05, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                movie.title,
                style: TextStyle(
                  fontSize: mq.width * 0.06,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
