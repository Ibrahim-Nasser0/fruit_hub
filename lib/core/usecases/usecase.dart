import 'package:dartz/dartz.dart';
import '../errors/failure.dart';

abstract class UseCase<type, Params> {
  Future<Either<Failure, type>> call(Params params);
}

class NoParams {
  const NoParams();
}

/// Example: Login Use Case
///
/// ```dart
/// class LoginUseCase extends UseCase<User, LoginParams> {
///   final AuthRepository repository;
///
///   LoginUseCase(this.repository);
///
///   @override
///   Future<Either<Failure, User>> call(LoginParams params) async {
///     return await repository.login(
///       email: params.email,
///       password: params.password,
///     );
///   }
/// }
///
/// class LoginParams {
///   final String email;
///   final String password;
///
///   LoginParams({required this.email, required this.password});
/// }
/// ```
