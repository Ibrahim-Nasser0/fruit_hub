import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/features/auth/domain/repositories/auth_repository.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository authRepository;
  ResetPasswordCubit({required this.authRepository})
    : super(ResetPasswordInitial());
  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());

    final result = await authRepository.resetPassword(email: email);

    result.fold(
      (failure) {
        emit(ResetPasswordFailure(failure.message));
      },
      (_) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
