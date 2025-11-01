

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:movies_db/features/movies/data/models/api_response.dart';

class HiveService {
  static const moviesBox = "moviesBox";

  static Future<void> init()async{
    await Hive.initFlutter();
    HiveAdapters.registerAdapters();
    Hive.openBox<ApiResponse>(moviesBox);
  }

  static Future<void> cacheMovies(ApiResponse apiResponse)async{
    final box = Hive.box<ApiResponse>(moviesBox);
    await box.put('cachedMovies', apiResponse);
  }

  static ApiResponse? getMovies(){
    final box = Hive.box<ApiResponse>(moviesBox);
    return  box.get('cachedMovies');
  }
}

class HiveAdapters{

  static void registerAdapters(){
    Hive.registerAdapter(ApiResponseAdapter());
    Hive.registerAdapter(MovieAdapter());
  }
}