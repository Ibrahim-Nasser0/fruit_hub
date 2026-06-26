import 'package:fruit_hub/core/services/firebase_auth_sevices.dart';
import 'package:fruit_hub/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fruit_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../network/network_info.dart';
import '../api/api_interceptors.dart';
import '../config/app_config.dart';

final getIt = GetIt.instance;

/// Initialize Dependency Injection
Future<void> init() async {
  //! Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());

  //! External
  getIt.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  //! Auth
  getIt.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );

  getIt.registerLazySingleton(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(ApiInterceptor());

    // Add pretty logger in debug mode
    if (AppConfig.enableLogging) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  });

  // Register your dependencies here
  // Example:
  // sl.registerFactory(() => LoginUseCase(sl()));
  // sl.registerFactory(() => AuthRepository(sl()));
}
