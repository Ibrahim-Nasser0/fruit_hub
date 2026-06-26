import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/di/injection_container.dart';
import 'package:fruit_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/signup_view_body.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/signup_cubit/sign_up_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepository: getIt<AuthRepository>()),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(
              "sign_up".tr(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            centerTitle: true,
          ),
          body: const SafeArea(child: SignUpViewBody()),
        ),
      ),
    );
  }
}
