
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_db/features/movies/cubit/movies_cubit.dart';
import 'package:movies_db/features/movies/presentation/widgets/movies_list.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MoviesListBuilder extends StatefulWidget {
  const MoviesListBuilder({super.key});

  @override
  State<MoviesListBuilder> createState() => _MoviesListBuilderState();
}

class _MoviesListBuilderState extends State<MoviesListBuilder> {

  bool _moviesFetched = false; // Flag to prevent multiple calls

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Check if movies have already been fetched
    if (!_moviesFetched && mounted) {
      getMovies();
      _moviesFetched = true; // Mark that movies have been fetched
    }
  }



  void getMovies()async{
      await context.watch<MoviesCubit>().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit,MoviesState>(
      builder: (context,state){

        switch(state){
          case MoviesInitial():
          case Loading():
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );

          case MoviesLoaded():
          return Expanded(child: MoviesList(movies: state.movies,));

          case MoviesFailure():
          return Expanded(
            child: Center(
              child: Text('Error Happened'),
            ),
          );
        }

    });
  }
}