import 'package:dartz/dartz.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';
import '../data_sources/movie_remote_data_source.dart';
import '../models/movie_model.dart';

class MovieRepositoryImplementation extends MovieRepository {
    final MovieRemoteDataSource remoteDataSource;

    MovieRepositoryImplementation(this.remoteDataSource);

    @override
    Future<Either<AppError, List<MovieModel>>> getTrending() async {
        try {
            final movies = await remoteDataSource.getTrending();

            return Right(movies);
        } on Exception {
            return const Left(
                AppError('can not fetch the trending movies!')
            );
        } 
    }

    @override
    Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
        try {
            final movies = await remoteDataSource.getComingSoon();

            return Right(movies);
        } on Exception {
            return const Left(
                AppError('can not fetch the coming soon movies!')
            );
        }
    }

    @override
    Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
        try {
            final movies = await remoteDataSource.getPlayingNow();

            return Right(movies);
        } on Exception {
            return const Left(
                AppError('can not fetch the playing now movies!')
            );
        }
    }

    @override
    Future<Either<AppError, List<MovieEntity>>> getPopular() async {
        try {
            final movies = await remoteDataSource.getPopular();

            return Right(movies);
        } on Exception {
            return const Left(
                AppError('can not fetch the popular movies!')
            );
        }
    }
}