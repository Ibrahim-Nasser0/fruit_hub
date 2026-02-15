import '../models/splash_model.dart';

abstract class SplashRemoteDataSource {
  Future<List<SplashModel>> getSplashs();
  Future<SplashModel> getSplashById(String id);
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  @override
  Future<List<SplashModel>> getSplashs() async {
    throw UnimplementedError();
  }

  @override
  Future<SplashModel> getSplashById(String id) async {
    throw UnimplementedError();
  }
}
