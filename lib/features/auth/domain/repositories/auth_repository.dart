import 'package:dartz/dartz.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import '../../../../core/errors/failure.dart';


abstract class AuthRepository {

   Future<Either<Failure, UserEntity>> createUserByEmailAndPassword({
    required String fullName,
    required String email,
    required String password,

  });
}
