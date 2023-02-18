import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class IUseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input input);
}
