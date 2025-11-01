// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'api_response.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
//   page: (json['page'] as num?)?.toInt(),
//   results: (json['results'] as List<dynamic>?)
//       ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
//       .toList(),
//   totalPages: (json['totalPages'] as num?)?.toInt(),
//   totalResults: (json['totalResults'] as num?)?.toInt(),
// );

// Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
//     <String, dynamic>{
//       'page': instance.page,
//       'results': instance.results,
//       'totalPages': instance.totalPages,
//       'totalResults': instance.totalResults,
//     };

// Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
//   backdropPath: json['backdropPath'] as String?,
//   genreIds: (json['genreIds'] as List<dynamic>?)
//       ?.map((e) => (e as num).toInt())
//       .toList(),
//   id: (json['id'] as num?)?.toInt(),
//   originalLanguage: json['originalLanguage'] as String?,
//   overview: json['overview'] as String?,
//   popularity: (json['popularity'] as num?)?.toDouble(),
//   posterPath: json['posterPath'] as String?,
//   title: json['title'] as String?,
//   voteAverage: (json['voteAverage'] as num?)?.toDouble(),
// );

// Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
//   'backdropPath': instance.backdropPath,
//   'genreIds': instance.genreIds,
//   'id': instance.id,
//   'originalLanguage': instance.originalLanguage,
//   'overview': instance.overview,
//   'popularity': instance.popularity,
//   'posterPath': instance.posterPath,
//   'title': instance.title,
//   'voteAverage': instance.voteAverage,
// };
