import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tmdbapp/screens/movie_view/movie_view.dart';

import '../../../models/movie_model.dart';
import '../../../services/api_service.dart';

class PopularSlider extends StatelessWidget {
  const PopularSlider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService().getPopularMovie(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        List<MovieModel> movies = snapshot.data!;
        return CarouselSlider(
          options: CarouselOptions(
            height: size.height * 0.2,
            autoPlay: true,
          ),
          items: movies.map((movie) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GestureDetector(
                    onTap: () {
                      Logger().e(movie.id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieView(
                                    movie: movie,
                                  )));
                    },
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(movie.backdropPath))),
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 3,
                              left: 3,
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    movie.title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))),
                          Positioned(
                              top: 3,
                              right: 3,
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Text(
                                        movie.voteAverage
                                            .toString()
                                            .substring(0, 3),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: 12,
                                      )
                                    ],
                                  )))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
