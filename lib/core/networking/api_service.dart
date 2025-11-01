




import 'package:dio/dio.dart';
import 'package:movies_db/core/networking/api_constances.dart';
import 'package:movies_db/features/movies/data/models/api_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';


part 'api_service.g.dart';


@RestApi(baseUrl: ApiConstances.apiBaseUrl)
abstract class ApiService {

    factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @GET(ApiConstances.popular)
  Future<ApiResponse> getPopularMovies( @Query('page') int page);

}