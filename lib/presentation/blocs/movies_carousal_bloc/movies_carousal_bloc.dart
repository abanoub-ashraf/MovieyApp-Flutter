import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_trending_use_case.dart';

part 'movies_carousal_event.dart';
part 'movies_carousal_state.dart';

class MoviesCarousalBloc extends Bloc<MoviesCarousalEvent, MoviesCarousalState> {
    final GetTrendingUseCase getTrendingUseCase;

    MoviesCarousalBloc({
        required this.getTrendingUseCase
    }) : super(
        MoviesCarousalStateInitial()
    ) {
        on<CarousalLoadEvent>((event, emit) async {
            final moviesEither = await getTrendingUseCase(NoParams());
            
            emit(
                moviesEither.fold(
                    (error) => MoviesCarousalStateError(), 
                    (loadedMovies) => MoviesCarousalStateLoaded(
                        movies: loadedMovies, 
                        defaultIndex: event.defaultIndex
                    )
                )
            );
        });
    }
}
