import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fruit_hub/core/routes/app_router.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/utils/dialogs.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';

import 'package:fruit_hub/features/auth/presentation/view/widgets/login_form.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/quick_login.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/login_cubit/login_cubit.dart';

import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.spacingMD.sp),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            AppDialogs.loading(context);
          } else {
            AppDialogs.hide(context);
          }

          if (state is LoginSuccess) {
            AppDialogs.success(
              context,
              title: 'success'.tr(),
              message: 'login_success'.tr(),
            );
          }

          if (state is LoginFailure) {
            AppDialogs.error(
              context,
              title: "oops".tr(),
              message: state.eMessage,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LoginLoading ? true : false,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  LoginForm(
                        formKey: _formKey,
                        passwordController: passwordController,
                        emailController: emailController,
                      )
                      .animate()
                      .shimmer(
                        delay: Duration(milliseconds: 40),
                        duration: Duration(milliseconds: 500),
                      )
                      .fade(
                        delay: Duration(milliseconds: 60),
                        duration: Duration(milliseconds: 500),
                      ),
                  Gap(AppConstants.spacingXS.h),
                  TextButton(
                    onPressed: () {
                      AppRouter.navigateTo(context, Routes.forgotPassword);
                    },
                    child: Text("forgot_password".tr()),
                  ),
                  Gap(AppConstants.spacingMD.h),
                  CustomButton(
                        text: "login".tr(),
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;
                          context
                              .read<LoginCubit>()
                              .loginUserByEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                        },
                      )
                      .animate()
                      .fade(delay: 100.ms, duration: 700.ms)
                      .slideY(
                        begin: .5,
                        delay: 100.ms,
                        duration: 500.ms,
                        curve: Curves.easeOutQuart,
                      )
                      .scale(
                        begin: const Offset(.7, .7),
                        end: const Offset(1, 1),
                        delay: 100.ms,
                        duration: 500.ms,
                        curve: Curves.easeOutBack,
                      ),
                  Gap(AppConstants.spacingMD.h),
                  const DontHaveAccountRow(),
                  Gap(AppConstants.spacingXL.h),
                  const OrDivider(),
                  Gap(AppConstants.spacingXL.h),
                  const QuickLogin(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'dont_have_account'.tr(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Gap(AppConstants.spacingXS.w),
        InkWell(
          radius: AppConstants.radiusXL.r,
          borderRadius: BorderRadius.circular(AppConstants.radiusXL.r),
          hoverColor: Theme.of(context).colorScheme.primary,
          onTap: () => AppRouter.navigateTo(context, Routes.signup),

          child: Text(
            "create_new_account".tr(),
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            radius: BorderRadius.circular(AppConstants.radiusRound),
            thickness: 1,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Gap(AppConstants.spacingMD),
        Text("or".tr(), style: Theme.of(context).textTheme.bodyLarge),
        Gap(AppConstants.spacingMD),
        Expanded(
          child: Divider(
            radius: BorderRadius.circular(AppConstants.radiusRound),
            thickness: 1,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
