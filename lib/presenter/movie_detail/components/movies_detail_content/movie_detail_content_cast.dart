import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movies/infra/shared/theme_extensions.dart';
import 'package:the_movies/models/movie_detail_model.dart';

import '../../movie_detail_controller.dart';
import 'movie_cast.dart';

class MovieDetailContentCast extends GetView<MovieDetailController> {
  final MovieDetailModel? movie;
  const MovieDetailContentCast({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGrey,
        ),
        Obx(() => ExpansionPanelList(
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (int index, bool isExpanded) {
                controller.showPanel.toggle();
              },
              children: [
                ExpansionPanel(
                    canTapOnHeader: false,
                    isExpanded: controller.showPanel.value,
                    headerBuilder: (context, isExpaded) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                Text('Elenco', style: TextStyle(fontSize: 16))),
                      );
                    },
                    body: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: movie?.cast
                                .map((e) => MovieCast(cast: e))
                                .toList() ??
                            [],
                      ),
                    )),
              ],
            ))
      ],
    );
  }
}
