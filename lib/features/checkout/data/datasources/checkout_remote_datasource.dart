import '../models/checkout_model.dart';

abstract class CheckoutRemoteDataSource {
  Future<List<CheckoutModel>> getCheckouts();
  Future<CheckoutModel> getCheckoutById(String id);
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  @override
  Future<List<CheckoutModel>> getCheckouts() async {
    throw UnimplementedError();
  }

  @override
  Future<CheckoutModel> getCheckoutById(String id) async {
    throw UnimplementedError();
  }
}
