import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/useCase/base_usecase.dart';
import 'package:movies_app/movies/domain/Repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/entities/recommendation_movies.dart';

 class GetRecommendationMoviesUsecase
    extends BaseUsecase<List<RecommendationMovies>, RecommendationMoviesParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationMoviesUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationMovies>>> call(RecommendationMoviesParameters parameters) async {
    return await baseMoviesRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationMoviesParameters extends Equatable {
  final int movieRecommendationId;

   RecommendationMoviesParameters({ required this.movieRecommendationId,});

  @override
  List<Object> get props => [movieRecommendationId];
}