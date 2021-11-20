import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movies/presenter/moveis/movies_controller.dart';

class MoviesHeader extends GetView<MoviesController> {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 198,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: Get.width * .8,
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
                onChanged: controller.filterByName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    label: const Text('Search movies'),
                    prefixIcon: const Icon(Icons.search),
                    labelStyle:
                        const TextStyle(fontSize: 15, color: Colors.grey),
                    contentPadding: EdgeInsets.zero,
                    floatingLabelBehavior: FloatingLabelBehavior.never)),
          )
        ],
      ),
    );
  }
}
