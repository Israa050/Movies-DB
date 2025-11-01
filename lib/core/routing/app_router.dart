import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_db/core/di/dependency_injection.dart';
import 'package:movies_db/core/routing/routes.dart';
import 'package:movies_db/features/movies/cubit/movies_cubit.dart';
import 'package:movies_db/features/movies/data/models/api_response.dart';
import 'package:movies_db/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:movies_db/features/movies/presentation/screens/movies_list_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.moviesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MoviesCubit>(),
            child: MoviesListScreen(),
          ),
        );

      case Routes.movieDetailsScreen:
      final movie = settings.arguments;
      if(movie is Movie){
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MoviesCubit>(),
            child: MovieDetailsScreen(movie: movie,),
          ),
        );
      }
    }
    return null;
  }
}
