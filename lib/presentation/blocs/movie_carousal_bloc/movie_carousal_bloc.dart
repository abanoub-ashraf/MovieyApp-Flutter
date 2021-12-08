import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_trending_use_case.dart';

part 'movie_carousal_event.dart';
part 'movie_carousal_state.dart';

class MovieCarousalBloc extends Bloc<MovieCarousalEvent, MovieCarousalState> {
    final GetTrendingUseCase getTrendingUseCase;

    MovieCarousalBloc({
        required this.getTrendingUseCase
    }) : super(
        MovieCarousalStateInitial()
    ) {
        on<CarousalLoadEvent>((event, emit) async {
            final moviesEither = await getTrendingUseCase(NoParams());
            
            emit(
                moviesEither.fold(
                    (error) => MovieCarousalStateError(), 
                    (loadedMovies) => MovieCarousalStateLoaded(
                        movies: loadedMovies, 
                        defaultIndex: event.defaultIndex
                    )
                )
            );
        });
    }
}
