import 'package:movies_app/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  MoviesModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['title'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        voteAverage: json?['voteAverage']!= null ? json['voteAverage'].toDouble() : 0.0,
        releaseDate: json['releaseDate']!= null ? json['voteAverage'].toString() : '',
      );
}
