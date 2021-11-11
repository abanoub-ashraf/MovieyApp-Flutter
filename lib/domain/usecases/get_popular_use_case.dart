// ignore_for_file: unnecessary_await_in_return

import 'package:dartz/dartz.dart';
import 'package:moviey_app/domain/entities/app_error.dart';
import 'package:moviey_app/domain/entities/movie_entity.dart';
import 'package:moviey_app/domain/entities/no_params.dart';
import 'package:moviey_app/domain/repositories/movie_repository.dart';
import 'package:moviey_app/domain/usecases/use_case.dart';

///
/// - this usecase will extend the usecase generic class giving it the type that 
///   this usecase will return which is a list of movie entity and also the 
///   params that it will take for that to happen
/// 
/// - the params will be another entity called no params class
///
class GetPopularUseCase extends UseCase<List<MovieEntity>, NoParams> {
    final MovieRepository repository;

    GetPopularUseCase(this.repository);

    @override
    Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
        return await repository.getPopular();
    }
}