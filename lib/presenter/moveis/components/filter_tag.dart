import 'package:flutter/material.dart';
import 'package:the_movies/infra/shared/theme_extensions.dart';

class FilterTag extends StatelessWidget {
  final title; 

   const FilterTag({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5 , vertical: 8),
      constraints: const BoxConstraints(
        minWidth: 100,
        minHeight: 30,
      ),
      decoration: BoxDecoration(
        color: context.themeRed,
        border: Border.all(color: context.themeRed),
        borderRadius: BorderRadius.circular(30),
      ),
      child:  Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
