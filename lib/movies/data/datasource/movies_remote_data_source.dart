import 'package:dio/dio.dart';
import 'package:movies_app/core/constance.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/network/error_message_network.dart';
import 'package:movies_app/movies/data/models/movies_details_model.dart';
import 'package:movies_app/movies/data/models/movies_model.dart';
import 'package:movies_app/movies/data/models/recommendation_movies_model.dart';
import 'package:movies_app/movies/domain/useCase/get_movies_details_usecase.dart';
import 'package:movies_app/movies/domain/useCase/get_recommendation_movies_usecase.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRateMovies();

  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailsParameters parameters);
  
  Future<List<RecommendationMovieModel>> getRecommendationMovie(RecommendationMoviesParameters parameters);

}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstance.nowPlayingMoviesPath);
    print(response);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRateMovies() async {
    final response = await Dio().get(AppConstance.topRateMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }

  @override
  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailsParameters parameters) async {
    final response = await Dio().get(AppConstance.topMoviesDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return  MoviesDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationMovieModel>> getRecommendationMovie(RecommendationMoviesParameters parameters) async{
    final response = await Dio().get(AppConstance.recommendationMoviesPath(parameters.movieRecommendationId));
    if (response.statusCode == 200) {
      return List<RecommendationMovieModel>.from((response.data['results'] as List)
          .map((e) => RecommendationMovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }  }
}
