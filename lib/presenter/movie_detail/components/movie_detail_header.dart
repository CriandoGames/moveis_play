import 'package:flutter/material.dart';

import 'package:the_movies/models/movie_detail_model.dart';



class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailHeader(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      return SizedBox(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie!.images.length,
              itemBuilder: (context, index) {
                final image = movie!.images[index];
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }));
    }

    return const SizedBox.shrink();
  }
}
