import 'package:flutter/material.dart';
import 'package:tmdbapp/models/movie_model.dart';
import 'package:tmdbapp/services/api_service.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key, required this.title, required this.future});

  final String title;
  final Future<List<MovieModel>> future;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text("Something Went Wrong");
              }

              List<MovieModel> movies = snapshot.data!;

              return SizedBox(
                height: 115,
                child: ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 220,
                        child: Container(
                          width: 220,
                          height: 110,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(movies[index].posterPath,
                                    width: 60, height: 100, fit: BoxFit.cover),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      movies[index].title,
                                      style: TextStyle(
                                          color: Colors.grey.shade300),
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          Text(
                                            movies[index]
                                                .voteAverage
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
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
      ],
    );
  }
}
