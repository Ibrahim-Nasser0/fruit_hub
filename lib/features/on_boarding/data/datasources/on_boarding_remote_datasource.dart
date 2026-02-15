import '../models/on_boarding_model.dart';

abstract class OnBoardingRemoteDataSource {
  Future<List<OnBoardingModel>> getOnBoardings();
  Future<OnBoardingModel> getOnBoardingById(String id);
}

class OnBoardingRemoteDataSourceImpl implements OnBoardingRemoteDataSource {
  @override
  Future<List<OnBoardingModel>> getOnBoardings() async {
    throw UnimplementedError();
  }

  @override
  Future<OnBoardingModel> getOnBoardingById(String id) async {
    throw UnimplementedError();
  }
}
