// ignore_for_file: avoid_print

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'di/get_it.dart' as getIt;
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/entities/no_params.dart';
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
    ///
    /// - unawaited means don't wait for the future till its done and keep going 
    ///   through the rest of the app
    /// 
    /// - we solved all the dependency injection in a separate file inside a future function
    ///   and we just wanna initialize that future function cause we need the first use of 
    ///   its content but also without waiting for its future return type to wait, 
    ///   we will ignore it
    ///
    unawaited(getIt.init());

    final GetTrendingUseCase getTrending = getIt.getItInstance<GetTrendingUseCase>();
    
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