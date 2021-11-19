import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movies/presenter/moveis/components/movies_header.dart';

import 'components/movies_filters.dart';

class MoveisPage extends StatelessWidget {
  const MoveisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: const [MoviesHeader(), MoviesFilters()],
      ),
    );
  }
}
