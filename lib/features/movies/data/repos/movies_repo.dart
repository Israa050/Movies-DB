
import 'package:movies_db/core/networking/api_results.dart';
import 'package:movies_db/core/networking/api_service.dart';
import 'package:movies_db/features/movies/data/models/api_response.dart';

class MoviesRepo {

  ApiService apiService;

  MoviesRepo({required this.apiService});


  Future<ApiResult<ApiResponse>> getPopularMovies(int page)async{
     try {
      final response = await apiService.getPopularMovies(page);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  
}