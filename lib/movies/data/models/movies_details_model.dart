import 'package:movies_app/movies/data/models/geners_model.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';

class MoviesDetailsModel extends MoviesDetails {
  const MoviesDetailsModel(
      {required super.id,
      required super.genres,
      required super.title,
      required super.backdropPath,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate,
      required super.runtime});

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
          id: json["id"],
          genres: List<GenersModel>.from(
              json["genres"].map((x) => GenersModel.fromJson(x))),
          title: json["title"],
          backdropPath: json["backdrop_path"],
          overview: json["overview"],
          voteAverage: json["vote_average"].toDouble(),
          releaseDate: json["release_date"],
          runtime: json["runtime"]);
}
