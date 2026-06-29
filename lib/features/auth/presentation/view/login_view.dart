import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/di/injection_container.dart';
import 'package:fruit_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            'login'.tr(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocProvider(
            create: (context) =>
                LoginCubit(authRepository: getIt<AuthRepository>()),
            child: LoginViewBody(),
          ),
        ),
      ),
    );
  }
}
