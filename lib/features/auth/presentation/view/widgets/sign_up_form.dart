import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/utils/dialogs.dart';
import 'package:fruit_hub/core/utils/validators.dart';
import 'package:fruit_hub/core/widgets/animations/button_animation.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/terms_and_conditons.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/signup_cubit/sign_up_cubit.dart';
import 'package:gap/gap.dart';
import '../../../../../core/widgets/animations/r_slide_animation.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  late bool isAccepted = false;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
                controller: fullNameController,
                validator: (value) =>
                    Validators.minLength(value, 8, fieldName: 'full_name'.tr()),
                keyboardType: TextInputType.name,
                hint: 'full_name'.tr(),
                prefixIcon: Icon(Icons.person),
              )
              .animate()
              .fade(delay: 10.ms, duration: 400.ms)
              .slideY(
                begin: .5,
                delay: 100.ms,
                duration: 400.ms,
                curve: Curves.fastOutSlowIn,
              ),
          Gap(AppConstants.spacingMD.h),

          CustomTextField(
                controller: emailController,
                validator: (value) => Validators.email(value),
                keyboardType: TextInputType.emailAddress,
                hint: 'email'.tr(),
                prefixIcon: Icon(Icons.email),
              )
              .animate()
              .fade(delay: 50.ms, duration: 400.ms)
              .slideY(
                begin: .5,
                delay: 150.ms,
                duration: 400.ms,
                curve: Curves.fastOutSlowIn,
              ),
          Gap(AppConstants.spacingMD.h),
          CustomTextField(
                controller: passwordController,
                validator: (value) => Validators.password(value),
                keyboardType: TextInputType.visiblePassword,
                hint: 'password'.tr(),
                obscureText: _obscurePassword,
                prefixIcon: Icon(Icons.lock_rounded),
                suffixIcon: IconButton(
                  style: Theme.of(context).iconButtonTheme.style,
                  onPressed: () => setState(() {
                    _obscurePassword = !_obscurePassword;
                  }),
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              )
              .animate()
              .fade(delay: 150.ms, duration: 400.ms)
              .slideY(
                begin: .5,
                delay: 200.ms,
                duration: 400.ms,
                curve: Curves.fastOutSlowIn,
              ),
          Gap(AppConstants.spacingMD.h),
          CustomTextField(
                controller: confirmPasswordController,
                validator: (value) => Validators.confirmPassword(
                  value,
                  confirmPasswordController.text,
                ),
                keyboardType: TextInputType.visiblePassword,
                hint: 'confirm_password'.tr(),
                obscureText: _obscureConfirmPassword,
                prefixIcon: Icon(Icons.lock_rounded),
                suffixIcon: IconButton(
                  style: Theme.of(context).iconButtonTheme.style,
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              )
              .animate()
              .fade(delay: 200.ms, duration: 400.ms)
              .slideY(
                begin: .5,
                delay: 250.ms,
                duration: 400.ms,
                curve: Curves.fastOutSlowIn,
              ),
          TermsAndConditons(
            onChanged: (value) {
              isAccepted = value;
            },
          ).rSlideAnimation(),
          Gap(AppConstants.spacingMD.h),
          CustomButton(
            text: "sign_up".tr(),
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;
              if (!isAccepted) {
                AppDialogs.error(
                  context,
                  title: "warning".tr(),
                  message: 'accept_terms_message'.tr(),
                );
                return;
              }

              context.read<SignUpCubit>().createUserByEmailAndPassword(
                fullName: fullNameController.text.trim(),
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
            },
          ).buttonAnimation(),
        ],
      ),
    );
  }
}
