import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

///
/// - this is a generic usecase class that every usecase will inherit from
/// 
/// - Type is what the UseCase will return which is the successful response type
/// 
/// - Params is the parameters to make the api call
///
abstract class UseCase<Type, Params> {
    Future<Either<AppError, Type>> call(Params params);
}