// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:moviey_app/domain/entities/app_error.dart';
import 'package:moviey_app/domain/entities/movie_entity.dart';
import 'package:moviey_app/domain/entities/no_params.dart';

import 'app/app_widget.dart';
import 'data/core/api_client.dart';
import 'data/data_sources/movie_remote_data_source.dart';
import 'data/data_sources/movie_remote_data_source_implementation.dart';
import 'data/repositories/movie_repository_implementation.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_trending_use_case.dart';

///
/// - the layers of the apps are presentation, domain and data
/// 
/// - presentation layer is the ui
/// 
/// - presentation layer is combination of widgets that makes a screen 
///   and the screen is called a journey
/// 
/// - data layer is responsible for bringing data from outside world like a rest api
/// 
/// - domain layer acts as a communication channel between the presentation layer 
///   and the data layer
/// 
/// - presentation and data layers both depend on the domain layer and they never interact
///   with each other
/// 
/// - common folder contains constants, extensions and utils in general
///
                                       
Future<void> main() async {
    final ApiClient apiClient = ApiClient(Client());

    final MovieRemoteDataSource dataSource  = MovieRemoteDataSourceImplementation(apiClient);
    final MovieRepository movieRepository   = MovieRepositoryImplementation(dataSource);
    final GetTrendingUseCase getTrending    = GetTrendingUseCase(movieRepository);
    
    final Either<AppError, List<MovieEntity>> eitherResponse = await getTrending(NoParams());

    eitherResponse.fold(
        (l) {
            print('error');
            print(l);
        },
        (r) {
            print('list of movies');
            print(r);
        },
    );
    
    runApp(
        const AppWidget()
    );
}