import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_db/core/helper/extensions.dart';
import 'package:movies_db/core/routing/routes.dart';
import 'package:movies_db/features/movies/cubit/movies_cubit.dart';
import 'package:movies_db/features/movies/data/models/api_response.dart';
import 'package:movies_db/features/movies/presentation/widgets/movie_card_info.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;
  MoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        // Determine if we are loading more data
        bool isLoading = state is Loading && context.read<MoviesCubit>().moviesList.length == movies.length;

        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            // If we've reached the bottom of the list, fetch more data
            if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
              context.read<MoviesCubit>().getPopularMovies(isLoadMore: true);
            }
            return true;
          },
          child: ListView.builder(
            itemCount: movies.length + (isLoading ? 1 : 0), // Add 1 for the loading spinner
            itemBuilder: (context, index) {
              if (index < movies.length) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(onTap: () => context.pushNamed(Routes.movieDetailsScreen,arguments: movies[index]), child: MovieCardInfo(movie: movies[index])),
                );
              } else if (isLoading) {
                // Show a loading spinner at the bottom of the list while loading more data
                return Center(
                  child: LinearProgressIndicator(), // Your spinner widget
                );
              } else {
                return Container(); // Empty container to prevent list overflow
              }
            },
          ),
        );
      },
    );
  }
}
