import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../core/providers/movies_details.dart';
import '../../../../main.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_details.dart';
import '../widgets/movie_details_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  final Size mq;
  const MovieDetailsScreen({required this.mq, Key? key, required this.movie})
      : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<void> movieDetailsAndRecommendationsInitializer;
  late Future<bool> checkConnection;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetailsAndRecommendationsInitializer =
        (getIt.get<MovieDetailsProvider>()).initialize(
      widget.movie.id.toString(),
    );
    checkConnection = () async {
      bool value = true;
      if ((await Connectivity().checkConnectivity()) !=
          ConnectivityResult.none) {
        try {
          final result = await InternetAddress.lookup('example.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            value = true;
          }
        } on SocketException catch (_) {
          value = false;
        }
      } else {
        value = false;
      }
      return value;
    }.call();
    mq = widget.mq;
    movie = widget.movie;
  }

  bool firstTime = true;
  late final Size mq;
  late final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1E29),
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: mq.height * 0.3,
                width: mq.width,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: movie.backgroundPath != ''
                            ? () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PhotoView(
                                      minScale:
                                          PhotoViewComputedScale.contained,
                                      maxScale: PhotoViewComputedScale.covered,
                                      errorBuilder: (context, url, error) =>
                                          ImageErrorWidget(movie: movie),
                                      imageProvider: CachedNetworkImageProvider(
                                        'https://image.tmdb.org/t/p/original/${movie.backgroundPath}',
                                      ),
                                    ),
                                  ),
                                )
                            : null,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/original/${movie.backgroundPath}',
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) =>
                              ImageErrorWidget(movie: movie),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const CircleAvatar(
                          backgroundColor: Colors.deepOrangeAccent,
                          radius: 25,
                          child: Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: mq.width * 0.9,
                  child: FutureBuilder(
                    future: movieDetailsAndRecommendationsInitializer,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return MovieDetailsWidget(
                          movie: movie,
                          mq: mq,
                          isLoading: true,
                        );
                      } else {
                        final movieDetailsProvider =
                            getIt.get<MovieDetailsProvider>();
                        MovieDetails? movieDetails;
                        List<Movie>? recommendedMoviesList;
                        if (firstTime) {
                          movieDetails = movieDetailsProvider.movieDetails;
                          recommendedMoviesList =
                              movieDetailsProvider.recommendedMovies;
                          firstTime = false;
                        }
                        return FutureBuilder(
                          future: checkConnection,
                          builder: (context, AsyncSnapshot<bool> snapshot) {
                            return MovieDetailsWidget(
                              mq: mq,
                              recommendedMoviesList: recommendedMoviesList ??
                                  movieDetailsProvider.recommendedMovies,
                              movieDetails: movieDetails ??
                                  movieDetailsProvider.movieDetails,
                              movie: movie,
                              isLoading: snapshot.connectionState ==
                                      ConnectionState.waiting
                                  ? true
                                  : (snapshot.data!)
                                      ? false
                                      : true,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Stack(
        children: [
          const Positioned.fill(
            child: FittedBox(
              child: Icon(
                Icons.close,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Positioned.fill(
            child: FittedBox(
              child: Text(
                movie.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
