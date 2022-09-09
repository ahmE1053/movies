import 'package:flutter/material.dart';
import 'package:movies/Movie%20Module/presentation/trying/screens/movie_details_screen.dart';

import '../../../domain/entities/movie.dart';
import '../widgets/movie_category_item_widget.dart';

class MoviesCategoryScreen extends StatelessWidget {
  const MoviesCategoryScreen(
      {Key? key, required this.movieList, required this.category})
      : super(key: key);
  final List<Movie> movieList;
  final String category;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          category,
        ),
      ),
      backgroundColor: const Color(0xff1E1E29),
      body: ListView.builder(
        itemExtent: mq.height * 0.2,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(mq: mq, movie: movie),
              ),
            ),
            child: MovieCategoryItem(
              movie: movie,
              mq: mq,
            ),
          );
        },
      ),
    );
  }
}
