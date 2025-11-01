

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_db/core/global/cubit/app_theme_cubit.dart';
import 'package:movies_db/core/networking/api_service.dart';
import 'package:movies_db/core/networking/dio_factory.dart';
import 'package:movies_db/features/movies/cubit/movies_cubit.dart';
import 'package:movies_db/features/movies/data/repos/movies_repo.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<AppThemeCubit>(() => AppThemeCubit(),);

  // Movies
  getIt.registerLazySingleton<MoviesRepo>(() => MoviesRepo(apiService: getIt()));
  getIt.registerFactory<MoviesCubit>(() => MoviesCubit(moviesRepo: getIt()));
}