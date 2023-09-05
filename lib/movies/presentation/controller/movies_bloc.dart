import 'package:bloc/bloc.dart';
import 'package:movies_app/core/useCase/base_usecase.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/useCase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/useCase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/useCase/get_top_rate_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
              nowPlayingState: RequstState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(state.copyWith(
              nowPlayingMovies: r, nowPlayingState: RequstState.isLoaded)));
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(const NoParameters());
      result.fold(
              (l) => emit(state.copyWith(
              popularState: RequstState.error,
              popularMessage: l.message)),
              (r) => emit(state.copyWith(
              popularMovies: r, popularState: RequstState.isLoaded)));
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase(const NoParameters());
      result.fold(
              (l) => emit(state.copyWith(
              topRatedState: RequstState.error,
              topRatedMessage: l.message)),
              (r) => emit(state.copyWith(
              topRatedMovies: r, topRatedState: RequstState.isLoaded)));
    });
  }
}
