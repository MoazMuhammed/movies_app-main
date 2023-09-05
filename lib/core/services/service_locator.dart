import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/Repository/movies_repository.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/Repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/useCase/get_movies_details_usecase.dart';
import 'package:movies_app/movies/domain/useCase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/useCase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/useCase/get_recommendation_movies_usecase.dart';
import 'package:movies_app/movies/domain/useCase/get_top_rate_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));sl.registerFactory(() => MoviesDetailsBloc(sl(),sl()));
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMoviesUsecase(sl()));
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());
  }
}
