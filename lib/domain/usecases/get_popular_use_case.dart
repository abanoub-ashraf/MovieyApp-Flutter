import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../entities/no_params.dart';
import '../repositories/movie_repository.dart';
import 'use_case.dart';

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
        return repository.getPopular();
    }
}