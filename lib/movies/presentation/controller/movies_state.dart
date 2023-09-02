import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

 class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequstState nowPlayingState;
  final String nowPlayingMessage;

  const MoviesState(
      {this.nowPlayingMovies = const[],
        this.nowPlayingState = RequstState.isLoading,
        this.nowPlayingMessage = ''
      });
  @override
  List<Object?> get props => [nowPlayingMovies,
  nowPlayingState,
  nowPlayingMessage,];
}