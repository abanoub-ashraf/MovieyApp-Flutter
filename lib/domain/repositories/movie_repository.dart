import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';

abstract class MovieRepository {
    ///
    /// Either comes from Dartz package and it's like the Result type in Swift
    ///
    Future<Either<AppError, List<MovieEntity>>> getTrending();
    Future<Either<AppError, List<MovieEntity>>> getPopular();
    Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
    Future<Either<AppError, List<MovieEntity>>> getComingSoon();
}