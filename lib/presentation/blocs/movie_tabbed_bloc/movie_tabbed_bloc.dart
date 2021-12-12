import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_coming_soon_use_case.dart';
import '../../../domain/usecases/get_playing_now_use_case.dart';
import '../../../domain/usecases/get_popular_use_case.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
    final GetPopularUseCase getPopularUseCase;
    final GetPlayingNowUseCase getPlayingNowUseCase;
    final GetComingSoonUseCase getComingSoonUseCase;

    MovieTabbedBloc({
        required this.getPopularUseCase, 
        required this.getPlayingNowUseCase, 
        required this.getComingSoonUseCase,
    }) : super(
        const MovieTabbedInitial()
    ) {
        on<MovieTabbedChangedEvent>((event, emit) async {
            late Either<AppError, List<MovieEntity>> movieEither;

            switch (event.currentTabIndex) {
                case 0:
                    movieEither = await getPopularUseCase(NoParams());
                    break;
                case 1:
                    movieEither = await getPlayingNowUseCase(NoParams());
                    break;
                case 2:
                    movieEither = await getComingSoonUseCase(NoParams());
                    break;
            }

            emit(
                movieEither.fold(
                    (error) {
                        return MovieTabbedErrorState(
                            currentTabIndex: event.currentTabIndex,
                        );
                    }, 
                    (movies) {
                        return MovieTabbedTapChangedState(
                            currentTabIndex: event.currentTabIndex, 
                            movies: movies,
                        );
                    }
                )
            );
        });
    }
}