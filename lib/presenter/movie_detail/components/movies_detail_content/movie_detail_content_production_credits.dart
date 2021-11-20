import 'package:flutter/material.dart';
import 'package:the_movies/infra/shared/theme_extensions.dart';
import 'package:the_movies/models/movie_detail_model.dart';

class MovieDetailContentProductionCredits extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailContentProductionCredits({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
        child: RichText(
            text: TextSpan(
                text: 'Companhia(s) produtora(s) :',
                style: TextStyle(
                  color: context.themeGrey,
                  fontWeight: FontWeight.bold,
                ),
                children: [
              TextSpan(
                text: ' ${movie?.productionCompanies.join(', ')}',
                style: TextStyle(
                  color: context.themeRed,
                ),
              )
            ])));
  }
}
