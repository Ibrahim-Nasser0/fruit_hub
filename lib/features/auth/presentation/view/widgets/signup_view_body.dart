import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/routes/app_router.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/sign_up_form.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/terms_and_conditons.dart';
import 'package:gap/gap.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.spacingMD.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SignUpForm(),
            // Gap(AppConstants.spacingMD.h),
            const TermsAndConditons(),
            Gap(AppConstants.spacingMD.h),
            CustomButton(text: "sign_up".tr(), onPressed: () {}),
            Gap(AppConstants.spacingMD.h),
            Row(
              children: [
                Text(
                  'have_account'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Gap(AppConstants.spacingXS.w),
                InkWell(
                  radius: AppConstants.radiusXL.r,
                  borderRadius: BorderRadius.circular(AppConstants.radiusXL.r),
                  hoverColor: Theme.of(context).colorScheme.primary,
                  onTap: () =>
                      AppRouter.navigateAndRemoveUntil(context, Routes.login),

                  child: Text(
                    "login".tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
