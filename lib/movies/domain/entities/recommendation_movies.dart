import 'package:equatable/equatable.dart';

class RecommendationMovies extends Equatable {
  final String? backdropPath;
  final int id;

  const RecommendationMovies({ this.backdropPath, required this.id});

  @override
  List<Object?> get props => [backdropPath, id];
}