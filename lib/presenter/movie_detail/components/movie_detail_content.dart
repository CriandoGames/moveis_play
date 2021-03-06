import 'package:flutter/material.dart';
import 'package:the_movies/models/movie_detail_model.dart';

import 'movies_detail_content/movie_detail_content_cast.dart';
import 'movies_detail_content/movie_detail_content_production_credits.dart';
import 'movies_detail_content/movie_detail_content_title.dart';
import 'movies_detail_content/movies_detail_content.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailContent({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContentTitle(
          movie: movie,
        ),
        MoviesDetailContent(
          movie: movie,
        ),
        MovieDetailContentProductionCredits(
          movie: movie,
        ),
        MovieDetailContentCast(
          movie: movie,
        )
      ],
    );
  }
}
