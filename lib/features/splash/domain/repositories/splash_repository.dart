import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/splash_entity.dart';

abstract class SplashRepository {
  Future<Either<Failure, List<SplashEntity>>> getSplashs();
  Future<Either<Failure, SplashEntity>> getSplashById(String id);
}
