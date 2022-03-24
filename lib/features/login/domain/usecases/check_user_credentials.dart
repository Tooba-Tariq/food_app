import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class CheckUserCredentials implements UseCase<bool, Params> {
  final UserRepository repository;

  CheckUserCredentials(this.repository);

  @override
  Future<Either<Failure, bool>?> call(Params params) async {
    return await repository.checkUserCredentials(params.user);
  }
}

class Params extends Equatable {
  final User user;

  const Params(this.user) : super();

  @override
  List get props => [];
}
