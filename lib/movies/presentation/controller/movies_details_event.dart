part of 'movies_details_bloc.dart';

abstract class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();
}

class GetMoviesDetailsEvent extends MoviesDetailsEvent {
  final int id;

  const GetMoviesDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}
class GetMoviesRecommendEvent extends MoviesDetailsEvent {
  final int id;

  const GetMoviesRecommendEvent(this.id);

  @override
  List<Object> get props => [id];
}