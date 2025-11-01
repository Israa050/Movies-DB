part of 'movies_cubit.dart';

sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class Loading extends MoviesState{}

final class MoviesLoaded extends MoviesState{
  List<Movie> movies;

  MoviesLoaded({required this.movies});
}


final class MoviesFailure extends MoviesState{

  ApiErrorModel error;

  MoviesFailure({required this.error});
}
