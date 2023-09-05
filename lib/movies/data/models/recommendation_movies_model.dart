import 'package:movies_app/movies/domain/entities/recommendation_movies.dart';

class RecommendationMovieModel extends RecommendationMovies {
  const RecommendationMovieModel(
      { super.backdropPath, required super.id});

  factory RecommendationMovieModel.fromJson(Map<String, dynamic> json) =>
      RecommendationMovieModel(
          backdropPath: json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5Burb.jpg',
          id: json['id']);
}
