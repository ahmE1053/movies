import 'package:flutter/material.dart';
import 'package:movies/Movie%20Module/presentation/trying/screens/movies_category_screen.dart';
import 'package:movies/core/providers/main_provider.dart';

import 'movie_item_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget(
      {Key? key, required this.mainProvider, required this.mq})
      : super(key: key);
  final MainProvider mainProvider;
  final Size mq;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: TextStyle(
                  fontSize: mq.width * 0.07,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoviesCategoryScreen(
                        category: 'Popular Movies',
                        movieList: mainProvider.popularMoviesList,
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  textStyle: TextStyle(
                    fontSize: mq.width * 0.04,
                    color: Colors.white,
                  ),
                ),
                child: const Text(
                  'See More',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: mq.height * 0.35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: mq.width * 0.45,
            itemBuilder: (context, index) {
              final movie = mainProvider.popularMoviesList[index];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: MovieItem(mq: mq, movie: movie),
              );
            },
            itemCount: mainProvider.popularMoviesList.take(4).length,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Rated',
                style: TextStyle(
                  fontSize: mq.width * 0.07,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoviesCategoryScreen(
                        category: 'Top Movies',
                        movieList: mainProvider.topRatedMoviesList,
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  textStyle: TextStyle(
                    fontSize: mq.width * 0.04,
                    color: Colors.white,
                  ),
                ),
                child: const Text(
                  'See More',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: mq.height * 0.35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: mq.width * 0.45,
            itemBuilder: (context, index) {
              final movie = mainProvider.topRatedMoviesList[index];
              return Padding(
                  padding: const EdgeInsets.all(10),
                  child: MovieItem(mq: mq, movie: movie));
            },
            itemCount: mainProvider.topRatedMoviesList.take(4).length,
          ),
        ),
      ],
    );
  }
}
