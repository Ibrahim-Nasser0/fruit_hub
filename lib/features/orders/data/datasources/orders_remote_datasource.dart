import '../models/orders_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrdersModel>> getOrderss();
  Future<OrdersModel> getOrdersById(String id);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  @override
  Future<List<OrdersModel>> getOrderss() async {
    throw UnimplementedError();
  }

  @override
  Future<OrdersModel> getOrdersById(String id) async {
    throw UnimplementedError();
  }
}
