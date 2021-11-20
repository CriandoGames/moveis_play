import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movies/presenter/moveis/components/movies_header.dart';
import 'package:the_movies/presenter/moveis/movies_controller.dart';

import 'components/movies_filters.dart';
import 'components/movies_group.dart';

class MoveisPage extends GetView<MoviesController> {
  const MoveisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: [
          const MoviesHeader(),
          const MoviesFilters(),
          MoviesGroup(
            title: 'Mais Populares',
            movies: controller.popularMovies,
          ),
          MoviesGroup(
            title: 'Top Filmes',
            movies: controller.topRateMovies,
          )
        ],
      ),
    );
  }
}
