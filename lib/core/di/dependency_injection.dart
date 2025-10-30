

// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:store_app/core/networking/api_service.dart';
// import 'package:store_app/core/networking/dio_factory.dart';
// import 'package:store_app/features/auth/data/repos/auth_repo.dart';
// import 'package:store_app/features/auth/data/services/auth_service.dart';
// import 'package:store_app/features/auth/logic/cubit/auth_cubit.dart';
// import 'package:store_app/features/home/data/repos/home_repo.dart';
// import 'package:store_app/features/home/logic/cubit/home_cubit.dart';
// import 'package:store_app/features/product_details/data/repos/product_repo.dart';
// import 'package:store_app/features/product_details/logic/cubit/product_cubit.dart';
// import 'package:store_app/features/review/data/repos/product_review_repo.dart';
// import 'package:store_app/features/review/logic/cubit/product_reviews_cubit.dart';


// final getIt = GetIt.instance;

// Future<void> setupGetIt() async {
//   // Dio & ApiService
//   Dio dio = DioFactory.getDio();
//   getIt.registerLazySingleton<AuthService>(() => AuthService(dio));

//   // login
//   getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(service: getIt()));
//   getIt.registerFactory<AuthCubit>(() => AuthCubit(authRepo:  getIt()));

//   // // signup
//   // getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
//   // getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

//   // home
//   getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
//   getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(apiService: getIt()));
//   getIt.registerFactory<HomeCubit>(() => HomeCubit(homeRepo: getIt()));

//   getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(apiService: getIt()));
//   getIt.registerFactory<ProductCubit>(() => ProductCubit(productRepo: getIt()));

//    getIt.registerLazySingleton<ProductReviewRepo>(() => ProductReviewRepo(apiService: getIt()));
//   getIt.registerFactory<ProductReviewsCubit>(() => ProductReviewsCubit(productReviewRepo: getIt()));
// }