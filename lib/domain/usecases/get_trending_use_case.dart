import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';
import '../entities/no_params.dart';
import 'use_case.dart';

import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

///
/// - UseCases are the Features that the App will work on
///   one UseCase per Feature
/// 
/// - they decide which repository to use
/// 
/// - they pass input parameters to fetch details from the repository
/// 
/// - they directly interact with the bloc
///

///
/// - this usecase will extend the usecase generic class giving it the type that 
///   this usecase will return which is a list of movie entity and also the 
///   params that it will take for that to happen
/// 
/// - the params will be another entity called no params class
///
class GetTrendingUseCase extends UseCase<List<MovieEntity>, NoParams> {
    final MovieRepository repository;

    GetTrendingUseCase(this.repository);

    @override
    Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
        return repository.getTrending();
    }
}