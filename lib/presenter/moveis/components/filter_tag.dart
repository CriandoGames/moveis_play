import 'package:flutter/material.dart';
import 'package:the_movies/infra/shared/theme_extensions.dart';
import 'package:the_movies/models/genre_model.dart';

class FilterTag extends StatelessWidget {
  final GenreModel genre;
  final bool _selected;
  final VoidCallback onTap;

  const FilterTag({
    required this.genre,
    selected = false,
    required this.onTap,
    Key? key,
  })  : _selected = selected,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        padding: const EdgeInsets.all(5),
        constraints: const BoxConstraints(
          minWidth: 100,
          minHeight: 30,
        ),
        decoration: BoxDecoration(
          color: _selected ? context.themeRed : context.themeGrey,
          border:
              Border.all(color: _selected ? context.themeRed : context.themeGrey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            genre.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
