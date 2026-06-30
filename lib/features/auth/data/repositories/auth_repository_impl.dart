import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exception_mapper.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/services/firebase_auth_sevices.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import '../../../../core/errors/failure.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepositoryImpl({required this.firebaseAuthServices});

  @override
  Future<Either<Failure, UserEntity>> createUserByEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(UserModel.fromFirebaseUser(user));
    } on AppException catch (e) {
      return Left(e.toFailure());
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUserByEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthServices.loginUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(UserModel.fromFirebaseUser(user));
    } on AppException catch (e) {
      return Left(e.toFailure());
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUserWithGoogle() async {
    try {
      final user = await firebaseAuthServices.loginWithGoogle();

      return Right(UserModel.fromFirebaseUser(user));
    } on AppException catch (e) {
      return Left(e.toFailure());
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      final user = await firebaseAuthServices.loginWithFacebook();

      return Right(UserModel.fromFirebaseUser(user));
    } on AppException catch (e) {
      return Left(e.toFailure());
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await firebaseAuthServices.sendPasswordResetEmail(email: email);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure());
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}
