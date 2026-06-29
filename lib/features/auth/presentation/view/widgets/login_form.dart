import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/utils/validators.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.emailController,
  });
  final GlobalKey formKey;
  final TextEditingController passwordController;
  final TextEditingController emailController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
                keyboardType: TextInputType.emailAddress,
                controller: widget.emailController,
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
          CustomTextField(
                keyboardType: TextInputType.visiblePassword,
                controller: widget.passwordController,
                validator: (value) => Validators.password(value),
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
              .fade(delay: 100.ms, duration: 400.ms)
              .slideY(
                begin: .5,
                delay: 150.ms,
                duration: 400.ms,
                curve: Curves.fastOutSlowIn,
              ),
        ],
      ),
    );
  }
}
