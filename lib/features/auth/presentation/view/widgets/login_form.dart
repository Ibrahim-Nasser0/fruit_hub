import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hint: 'email'.tr(), prefixIcon: Icon(Icons.email)),
        Gap(AppConstants.spacingMD.h),
        CustomTextField(
          hint: 'password'.tr(),
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
