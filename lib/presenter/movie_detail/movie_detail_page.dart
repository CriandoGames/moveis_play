import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movie_detail_controller.dart';
import 'components/movie_detail_content.dart';
import 'components/movie_detail_header.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: SingleChildScrollView(
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieDetailHeader(controller.movie.value),
                MovieDetailContent(movie: controller.movie.value),
              ],
            )),
      ),
    );
  }
}
