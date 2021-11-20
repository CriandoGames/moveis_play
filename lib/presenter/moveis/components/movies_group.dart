import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movies/models/movies_model.dart';
import 'package:the_movies/presenter/components/movie_card.dart';

class MoviesGroup extends StatelessWidget {
  final String title;
  final List<MoviesModel> movies;
  const MoviesGroup({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount: movies.length,
                  itemBuilder: (context, index) => MovieCard(
                    movie: movies[index],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

