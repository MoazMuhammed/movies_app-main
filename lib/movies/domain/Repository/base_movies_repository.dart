import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation_movies.dart';
import 'package:movies_app/movies/domain/useCase/get_movies_details_usecase.dart';
import 'package:movies_app/movies/domain/useCase/get_recommendation_movies_usecase.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure ,List<Movies>>> getNowPlayingMovies();
  Future<Either<Failure ,List<Movies>>> getPopularMovies();
  Future<Either<Failure ,List<Movies>>> getTopRateMovies();
  Future<Either<Failure, MoviesDetails>> getMovieDetails(MoviesDetailsParameters parameters);
  Future<Either<Failure,List<RecommendationMovies>>> getRecommendationMovies(RecommendationMoviesParameters parameters);
}