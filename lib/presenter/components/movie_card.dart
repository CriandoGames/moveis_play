import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movies/models/movies_model.dart';

class MovieCard extends StatelessWidget {
  final MoviesModel movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ()=> Get.toNamed('/movie/detail', arguments: movie.id),
      child: Container(
          padding: const EdgeInsets.all(8),
          width: 148,
          height: 280,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/' + movie.posterPath,
                        width: 148,
                        height: 184,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(movie.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600)),
                  Text(movie.relaseDate,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.w300)),
                ],
              ),
              Positioned(
                bottom: 70,
                right: -9,
                child: Material(
                  elevation: 5,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    height: 30,
                    child: IconButton(
                      iconSize: 13,
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        print('Clicou no favorito');
                      },
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
