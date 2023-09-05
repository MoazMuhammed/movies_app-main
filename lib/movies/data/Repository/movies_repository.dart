import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/Repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation_movies.dart';
import 'package:movies_app/movies/domain/useCase/get_movies_details_usecase.dart';
import 'package:movies_app/movies/domain/useCase/get_recommendation_movies_usecase.dart';

class MoviesRepository extends BaseMoviesRepository{
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure ,List<Movies>>> getNowPlayingMovies() async{
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageNetwork.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageNetwork.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRateMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRateMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageNetwork.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getMovieDetails(MoviesDetailsParameters parameters) async{
    final result = await baseMoviesRemoteDataSource.getMoviesDetails(parameters);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageNetwork.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationMovies>>> getRecommendationMovies(RecommendationMoviesParameters parameters)async {
    final result =  await baseMoviesRemoteDataSource.getRecommendationMovie(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageNetwork.statusMessage));
    }
  }


}