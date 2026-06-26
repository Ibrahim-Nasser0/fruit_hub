import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repositories/auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;
  SignUpCubit({required this.authRepository}) : super(SignUpInitial());

  Future<void> createUserByEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    final result = await authRepository.createUserByEmailAndPassword(
      fullName: fullName,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SignUpFailure(eMessage: failure.message)),
      (user) => emit(SignUpSuccess(userEntity: user)),
    );
  }
}
