import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/on_boarding_entity.dart';

abstract class OnBoardingRepository {
  Future<Either<Failure, List<OnBoardingEntity>>> getOnBoardings();
  Future<Either<Failure, OnBoardingEntity>> getOnBoardingById(String id);
}
