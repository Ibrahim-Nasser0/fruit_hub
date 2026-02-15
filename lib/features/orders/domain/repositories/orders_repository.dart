import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/orders_entity.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrdersEntity>>> getOrderss();
  Future<Either<Failure, OrdersEntity>> getOrdersById(String id);
}
