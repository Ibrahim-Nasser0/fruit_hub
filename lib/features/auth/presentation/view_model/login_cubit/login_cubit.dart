import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repositories/auth_repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  LoginCubit({required this.authRepository}) : super(LoginInitial());

  Future<void> loginUserByEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepository.loginUserByEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginFailure(eMessage: failure.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepository.loginUserWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(eMessage: failure.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepository.loginWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(eMessage: failure.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }
}
