import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/data_sources/movie_remote_data_source_implementation.dart';
import '../data/repositories/movie_repository_implementation.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/get_coming_soon_use_case.dart';
import '../domain/usecases/get_playing_now_use_case.dart';
import '../domain/usecases/get_popular_use_case.dart';
import '../domain/usecases/get_trending_use_case.dart';
import '../presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import '../presentation/blocs/movie_tabbed_bloc/movie_tabbed_bloc.dart';
import '../presentation/blocs/movies_carousal_bloc/movies_carousal_bloc.dart';

///
/// I is a short form to access the instance of GetIt
///
final getItInstance = GetIt.I;

Future init() async {
    ///
    /// - instantiate the client that will get called on its first use onf the app
    /// 
    /// - this line will be used as a dependency to the line beneath it
    ///
    getItInstance.registerLazySingleton<Client>(
        () => Client()
    );
    
    ///
    /// - instantiate api client that depends on the client above it
    /// 
    /// - getItInstance() represents the line above it which is what this api client depends on
    /// 
    /// - this line will be used as a dependency to the line beneath it
    /// 
    /// - same things for each of the following lines beneath this one
    ///
    getItInstance.registerLazySingleton<ApiClient>(
        () => ApiClient(
            getItInstance()
        )
    );
    
    getItInstance.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImplementation(
            getItInstance()
        )
    );

    getItInstance.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImplementation(
            getItInstance()
        )
    );

    getItInstance.registerLazySingleton<GetTrendingUseCase>(
        () => GetTrendingUseCase(
            getItInstance()
        )
    );

    getItInstance.registerLazySingleton<GetComingSoonUseCase>(
        () => GetComingSoonUseCase(
            getItInstance()
        )
    );

    getItInstance.registerLazySingleton<GetPopularUseCase>(
        () => GetPopularUseCase(
            getItInstance()
        )
    );

    getItInstance.registerLazySingleton<GetPlayingNowUseCase>(
        () => GetPlayingNowUseCase(
            getItInstance()
        )
    );

    getItInstance.registerFactory(
        () => MovieBackdropBloc()
    );

    getItInstance.registerFactory(
        () => MoviesCarousalBloc(
            getTrendingUseCase: getItInstance(),
            movieBackdropBloc: getItInstance()
        )
    );

    getItInstance.registerFactory(
        () => MovieTabbedBloc(
            getPopularUseCase: GetPopularUseCase(getItInstance()), 
            getPlayingNowUseCase: GetPlayingNowUseCase(getItInstance()), 
            getComingSoonUseCase: GetComingSoonUseCase(getItInstance())
        )
    );
}