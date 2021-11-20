import 'package:flutter/material.dart';
import 'package:the_movies/models/cast_model.dart';

class MovieCast extends StatelessWidget {
  final CastModel? cast;
  const MovieCast({Key? key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var foundCast = cast;
    if (foundCast == null ||
        foundCast.image == 'https://image.tmdb.org/t/p/w500/null') {
      return const SizedBox.shrink();
    }
    return Container(
        width: 95,
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              foundCast.image,
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            foundCast.name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Text(
            foundCast.caracter,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ]));
  }
}
