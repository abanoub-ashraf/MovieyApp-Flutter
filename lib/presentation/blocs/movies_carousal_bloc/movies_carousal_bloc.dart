import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../movie_backdrop_bloc/movie_backdrop_bloc.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_trending_use_case.dart';

part 'movies_carousal_event.dart';
part 'movies_carousal_state.dart';

class MoviesCarousalBloc extends Bloc<MoviesCarousalEvent, MoviesCarousalState> {
    final GetTrendingUseCase getTrendingUseCase;
    final MovieBackdropBloc movieBackdropBloc;

    MoviesCarousalBloc({
        required this.getTrendingUseCase,
        required this.movieBackdropBloc,
    }) : super(
        MoviesCarousalStateInitial()
    ) {
        on<CarousalLoadEvent>((event, emit) async {
            final moviesEither = await getTrendingUseCase(NoParams());
            
            emit(
                moviesEither.fold(
                    (error) => MoviesCarousalStateError(), 
                    (loadedMovies) {
                        ///
                        /// add the event to the movie backdrop bloc when we emit 
                        /// the carousal loaded state so that we get the image of 
                        /// the first movie when the app starts
                        ///
                        movieBackdropBloc.add(
                            MovieBackdropChangedEvent(
                                movie: loadedMovies[event.defaultIndex]
                            )
                        );

                        return MoviesCarousalStateLoaded(
                            movies: loadedMovies, 
                            defaultIndex: event.defaultIndex
                        );
                    }
                )
            );
        });
    }
}
