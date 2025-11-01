import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_db/core/networking/api_error_model.dart';
import 'package:movies_db/features/movies/data/local/hive_service.dart';
import 'package:movies_db/features/movies/data/models/api_response.dart';
import 'package:movies_db/features/movies/data/repos/movies_repo.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepo moviesRepo;

  MoviesCubit({required this.moviesRepo}) : super(MoviesInitial());

  int currentPage = 1;
  bool hasMore = true;
  List<Movie> moviesList = [];
  
  // Track the pages that have already been fetched
  Set<int> fetchedPages = Set<int>();

  Future<void> getPopularMovies({bool isLoadMore = false}) async {
    // If we're loading more and no more data is available, exit early
    if (!hasMore && isLoadMore) return;

    // If it's the first request or we're not loading more, start fresh
    if (!isLoadMore) {
      currentPage = 1;
      moviesList.clear();  // Clear the list only when starting a fresh load
      hasMore = true;
      emit(Loading());
    }

    // Skip if the page is already fetched
    if (fetchedPages.contains(currentPage)) {
      return;  // If this page was already fetched, don't make the API call
    }

    // Mark the page as fetched before making the API call
    fetchedPages.add(currentPage);

    // Fetch data from the repository
    final response = await moviesRepo.getPopularMovies(currentPage);

    response.when(
      onSuccess: (movies) async{
        // Check if we've reached the last page
        if (movies.page! >= movies.totalPages!) {
          hasMore = false;
        } else {
          // Add new movies to the list
          moviesList.addAll(movies.results!);
          currentPage++;  // Move to the next page
        }
       await HiveService.cacheMovies(movies);
        emit(MoviesLoaded(movies: moviesList));  // Emit updated list
      },
      onError: (error) {
        final data = HiveService.getMovies();
        if(data != null){
          emit(MoviesLoaded(movies: data.results!));
        }else{
        emit(MoviesFailure(error: error));
        }
      },
    );
  }

  // Load more data when called
  void loadMore() {
    if (hasMore) {
      getPopularMovies(isLoadMore: true);  // Fetch the next page of movies
    }
  }
}
