import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/login_form.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/quick_login.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.spacingMD.sp),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            LoginForm(),
            Gap(AppConstants.spacingXS.h),
            TextButton(onPressed: () {}, child: Text("forgot_password".tr())),
            Gap(AppConstants.spacingMD.h),
            CustomButton(text: "login".tr(), onPressed: () {}),
            Gap(AppConstants.spacingMD.h),
            Row(
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
                  onTap: () {},
                  child: Text(
                    "create_new_account".tr(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            Gap(AppConstants.spacingXL.h),
            const OrDivider(),
            Gap(AppConstants.spacingXL.h),
            const QuickLogin(),
          ],
        ),
      ),
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
