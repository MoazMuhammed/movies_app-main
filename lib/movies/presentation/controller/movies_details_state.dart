part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  const MoviesDetailsState({
    this.moviesDetails,
    this.moviesDetailsState = RequstState.isLoading,
    this.moviesDetailsMessage = '',
    this.recommendationMovies = const[],
    this.recommendationMoviesState = RequstState.isLoading,
    this.recommendationMoviesMessage = '',
  });

  final MoviesDetails? moviesDetails;
  final RequstState moviesDetailsState;
  final String moviesDetailsMessage;
  final List<RecommendationMovies> recommendationMovies;
  final RequstState recommendationMoviesState;
  final String recommendationMoviesMessage;

  MoviesDetailsState copyWith({
    MoviesDetails? moviesDetails,
    RequstState? moviesDetailsState,
    String? message,
    List<RecommendationMovies>? recommendationMovies,
    RequstState? recommendationMoviesState,
    String? recommendationMoviesMessage,

  }) {
    return MoviesDetailsState(
        moviesDetails: moviesDetails ?? this.moviesDetails,
        moviesDetailsMessage: message ?? this.moviesDetailsMessage,
        moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
        recommendationMovies: recommendationMovies ?? this.recommendationMovies,
        recommendationMoviesState: recommendationMoviesState ??
            this.recommendationMoviesState,
        recommendationMoviesMessage: recommendationMoviesMessage ??
            this.recommendationMoviesMessage
    );
  }

  @override
  List<Object?> get props =>
      [
        moviesDetails,
        moviesDetailsState,
        moviesDetailsMessage,
        recommendationMovies,
        recommendationMoviesState,
        recommendationMoviesMessage,
      ];
}
