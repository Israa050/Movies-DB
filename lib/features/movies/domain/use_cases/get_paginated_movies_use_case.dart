
import 'package:movies_db/features/movies/data/models/api_response.dart';
import 'package:movies_db/features/movies/data/repos/movies_repo.dart';

class GetPaginatedMoviesUseCase {

  final MoviesRepo repository;

  GetPaginatedMoviesUseCase(this.repository);


  Future<(List<Movie> movies, int nextPage, bool isLastPage)?>? call({
    required int currentPage,
    required List<Movie> currentMovies,
  }) async {
    // Ask the repository for the next page
    final result = await repository.getPopularMovies(currentPage);

    result.when(onSuccess: (data){
       final response = data;
    final newMovies = [...currentMovies, ...? response.results];
    final isLastPage = response.page! >= response.totalPages!;
    final nextPage = isLastPage ? response.page : response.page! + 1;

    return (newMovies, nextPage, isLastPage);
    }, onError: (error){
      //return null;
      throw Exception(result.toString());
    });

    return null;
  }



}