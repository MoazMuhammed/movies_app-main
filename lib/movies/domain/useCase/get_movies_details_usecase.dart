import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/useCase/base_usecase.dart';
import 'package:movies_app/movies/domain/Repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';

class GetMovieDetailsUseCase
    extends BaseUsecase<MoviesDetails, MoviesDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MoviesDetails>> call(
      MoviesDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MoviesDetailsParameters extends Equatable {
  final int movieId;

  const MoviesDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];

}