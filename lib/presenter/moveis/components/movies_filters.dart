import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movies/presenter/moveis/movies_controller.dart';

import 'filter_tag.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
            children: controller.listGenres
                .map((genre) => FilterTag(
                      genre: genre,
                      onTap: () => controller.filterMoviesByGenre(genre),
                      selected: controller.genreSelected.value?.id == genre.id,
                    ))
                .toList(),
          )),
    );
  }
}
