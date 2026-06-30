import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/di/injection_container.dart';
import 'package:fruit_hub/core/routes/app_router.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/utils/dialogs.dart';
import 'package:fruit_hub/core/utils/validators.dart';
import 'package:fruit_hub/core/widgets/animations/button_animation.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:gap/gap.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (context) =>
            ResetPasswordCubit(authRepository: getIt<AuthRepository>()),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(
              'forgot_password'.tr(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            centerTitle: true,
          ),
          body: ForgotPasswordViewBody(),
        ),
      ),
    );
  }
}

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacingMD.sp),
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordLoading) {
              AppDialogs.loading(context);
            }

            if (state is ResetPasswordSuccess) {
              AppDialogs.hide(context);

              AppDialogs.success(
                context,
                title: 'success'.tr(),
                message: 'password_reset_sent'.tr(),
                onPressed: () {
                  AppRouter.navigateAndReplace(context, Routes.login);
                },
              );
            }

            if (state is ResetPasswordFailure) {
              AppDialogs.hide(context);

              AppDialogs.error(
                context,
                title: 'oops'.tr(),
                message: state.message.tr(),
              );
            }
          },
          builder: (context, state) {
            return ListView(
              children: [
                Text(
                  // textAlign: TextAlign.center,
                  "reset_password_info1".tr(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Gap(AppConstants.spacingXL.h),
                CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) => Validators.email(value),
                      hint: 'email'.tr(),
                      prefixIcon: Icon(Icons.email),
                    )
                    .animate()
                    .fade(delay: 50.ms, duration: 400.ms)
                    .slideY(
                      begin: .5,
                      delay: 100.ms,
                      duration: 400.ms,
                      curve: Curves.fastOutSlowIn,
                    ),
                Gap(AppConstants.spacingMD.h),
                CustomButton(
                  isLoading: state is ResetPasswordLoading,
                  text: "send_reset_link".tr(),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    context.read<ResetPasswordCubit>().resetPassword(
                      emailController.text.trim(),
                    );
                  },
                ).buttonAnimation(),
                Gap(AppConstants.spacingMD.h),
                Text(
                  textAlign: TextAlign.center,
                  "reset_password_info2".tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    //color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
