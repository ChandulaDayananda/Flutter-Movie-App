import 'package:flutter/material.dart';
import 'package:tmdbapp/services/api_service.dart';
import 'widgets/custom_tool_bar.dart';
import 'widgets/movies_list_view.dart';
import 'widgets/popular_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomToolBar(),
              const SizedBox(
                height: 10,
              ),
              PopularSlider(size: size),
              const SizedBox(
                height: 10,
              ),
              MoviesListView(
                  title: "Now Plating",
                  future: ApiService().getNowPlayingMovies()),
              MoviesListView(
                  title: "Top Rated Movies",
                  future: ApiService().getTopRateMovies()),
              MoviesListView(
                  title: "Upcoming Movies",
                  future: ApiService().getUpcomingMovies()),
            ],
          ),
        ),
      ),
    );
  }
}
