import 'package:flutter/material.dart';
import 'package:the_movies/models/movie_detail_model.dart';

class MoviesDetailContent extends StatelessWidget {
  final MovieDetailModel? movie;

  const MoviesDetailContent({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 50),
        child: Text(
          movie?.overview ?? '',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(height: 1.3),
        ),
      ),
    );
  }
}
