import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation_movies.dart';
import 'package:movies_app/movies/domain/useCase/get_movies_details_usecase.dart';
import 'package:movies_app/movies/domain/useCase/get_recommendation_movies_usecase.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationMoviesUsecase) : super(const MoviesDetailsState()) {
    on<GetMoviesDetailsEvent>(getMoviesDetailsEvent);
    on<GetMoviesRecommendEvent>(getRecommendationMoviesEvent);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMoviesUsecase getRecommendationMoviesUsecase;

  FutureOr<void> getMoviesDetailsEvent(GetMoviesDetailsEvent event, Emitter<MoviesDetailsState> emit) async{
    final result = await getMovieDetailsUseCase(MoviesDetailsParameters(movieId: event.id));
    result.fold(
            (l) => emit(state.copyWith(
            moviesDetailsState:RequstState.error,
            message: l.message)),
            (r) => emit(state.copyWith(
            moviesDetails: r, moviesDetailsState: RequstState.isLoaded)));

  }

  FutureOr<void> getRecommendationMoviesEvent(GetMoviesRecommendEvent event, Emitter<MoviesDetailsState> emit) async {
    final result = await getRecommendationMoviesUsecase(RecommendationMoviesParameters(movieRecommendationId: event.id));
    result.fold(
            (l) => emit(state.copyWith(
            recommendationMoviesState:RequstState.error,
            recommendationMoviesMessage: l.message)),
            (r) => emit(state.copyWith(
            recommendationMovies: r, recommendationMoviesState: RequstState.isLoaded)));

  }
}
