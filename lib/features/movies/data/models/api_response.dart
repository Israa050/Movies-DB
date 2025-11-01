



// import 'package:json_annotation/json_annotation.dart';


// part 'api_response.g.dart';

// @JsonSerializable()
// class ApiResponse {
//   int? page;
//   List<Movie>? results;
//   int? totalPages;
//   int? totalResults;

//   ApiResponse({this.page, this.results, this.totalPages, this.totalResults});

//   factory ApiResponse.fromJson(Map<String, dynamic> json)=> _$ApiResponseFromJson(json);


// }


// @JsonSerializable()
// class Movie {
//   String? backdropPath;
//   List<int>? genreIds;
//   int? id;
//   String? originalLanguage;
//   String? overview;
//   double? popularity;
//   String? posterPath;
//   String? title;
//   double? voteAverage;

//   Movie(
//       {
//       this.backdropPath,
//       this.genreIds,
//       this.id,
//       this.originalLanguage,
//       this.overview,
//       this.popularity,
//       this.posterPath,
//       this.title,
//       this.voteAverage,
//       });

//   factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

// }


class ApiResponse {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  ApiResponse({this.page, this.results, this.totalPages, this.totalResults});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results!.add(new Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  
}

class Movie {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movie(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}