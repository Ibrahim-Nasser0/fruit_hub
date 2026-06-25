import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          keyboardType: TextInputType.name,
          hint: 'full_name'.tr(),
          prefixIcon: Icon(Icons.person),
        ),
        Gap(AppConstants.spacingMD.h),
        CustomTextField(
          keyboardType: TextInputType.emailAddress,
          hint: 'email'.tr(),
          prefixIcon: Icon(Icons.email),
        ),
        Gap(AppConstants.spacingMD.h),
        CustomTextField(
          keyboardType: TextInputType.visiblePassword,
          hint: 'password'.tr(),
          obscureText: true,
          prefixIcon: Icon(Icons.lock_rounded),
          suffixIcon: IconButton(
            style: Theme.of(context).iconButtonTheme.style,
            onPressed: () {},
            icon: Icon(Icons.remove_red_eye_outlined),
          ),
        ),
        Gap(AppConstants.spacingMD.h),
        CustomTextField(
          keyboardType: TextInputType.visiblePassword,
          hint: 'confirm_password'.tr(),
          obscureText: true,
          prefixIcon: Icon(Icons.lock_rounded),
          suffixIcon: IconButton(
            style: Theme.of(context).iconButtonTheme.style,
            onPressed: () {},
            icon: Icon(Icons.remove_red_eye_outlined),
          ),
        ),
      ],
    );
  }
}
