import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/checkout_entity.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, List<CheckoutEntity>>> getCheckouts();
  Future<Either<Failure, CheckoutEntity>> getCheckoutById(String id);
}
