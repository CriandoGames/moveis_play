import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:the_movies/infra/shared/theme_extensions.dart';
import 'package:the_movies/models/movie_detail_model.dart';

class MovieDetailContentTitle extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailContentTitle({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentMovie = movie;
    if(currentMovie == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie?.title ?? '',
              style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 8),
          RatingStars(
            value: (movie?.stars ?? 1) / 2,
            valueLabelVisibility: false,
            starColor: context.themeOrange,
            starSize: 14,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...currentMovie.genres.map((genre) => Text(genre.name + ', ',
                  style: Theme.of(context).textTheme.caption)),
            ],
          )
        ],
      ),
    );
  }
}
