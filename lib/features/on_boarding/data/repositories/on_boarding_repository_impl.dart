import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/on_boarding_entity.dart';
import '../../domain/repositories/on_boarding_repository.dart';
import '../datasources/on_boarding_remote_datasource.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  final OnBoardingRemoteDataSource remoteDataSource;

  OnBoardingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<OnBoardingEntity>>> getOnBoardings() async {
    try {
      final result = await remoteDataSource.getOnBoardings();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, OnBoardingEntity>> getOnBoardingById(String id) async {
    try {
      final result = await remoteDataSource.getOnBoardingById(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    }
  }
}
