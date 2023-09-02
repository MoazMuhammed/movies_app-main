import 'package:bloc/bloc.dart';
import 'package:movies_app/movies/data/Repository/movies_repository.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/Repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/useCase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState>{
  MoviesBloc() : super(const MoviesState()){
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMoviesRemoteDataSource baseMoviesRemoteDataSource = MoviesRemoteDataSource();
      BaseMoviesRepository baseMoviesRepository = MoviesRepository(baseMoviesRemoteDataSource) ;
     final result =  await GetNowPlayingMoviesUseCase(baseMoviesRepository).execute();
result.fold((l) => null, (r) => result);
print(result.right);
    });
  }

}