import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/widgets/animations/fade_animation.dart';
import 'package:fruit_hub/core/widgets/animations/l_slide_animation.dart';

import 'package:fruit_hub/core/widgets/animations/r_slide_animation.dart';
import 'package:gap/gap.dart';

class QuickLogin extends StatelessWidget {
  const QuickLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocialLoginButton(
          socialIcon: AppImages.googleIcon,
          tital: "with_google",
        ).rSlideAnimation(),
        Gap(AppConstants.spacingMD.h),
        CustomSocialLoginButton(
          socialIcon: AppImages.appleIcon,
          tital: 'with_apple',
          isBlack: true,
        ).lSlideAnimation(),
        Gap(AppConstants.spacingMD.h),
        CustomSocialLoginButton(
          socialIcon: AppImages.facebookIcon,
          tital: 'with_facebook',
        ).rSlideAnimation(),
      ],
    );
  }
}

class CustomSocialLoginButton extends StatelessWidget {
  const CustomSocialLoginButton({
    super.key,
    required this.socialIcon,
    required this.tital,
    this.isBlack = false,
  });
  final String socialIcon;
  final String tital;
  final bool isBlack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Theme.of(context).colorScheme.primary,
      radius: AppConstants.radiusXL.r,
      borderRadius: BorderRadius.circular(AppConstants.radiusXL.r),
      child: Container(
        width: 340.w,
        height: 56.h,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: AppConstants.spacingMD.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radiusXL.r),
          border: Border.all(color: Theme.of(context).colorScheme.onSurface),
        ),
        child: Row(
          children: [
            isBlack
                ? SvgPicture.asset(
                    socialIcon,
                    width: AppConstants.iconSizeMD.sp,
                    color: Theme.of(context).colorScheme.onSurface,
                  ).fadeAnimation()
                : SvgPicture.asset(
                    socialIcon,
                    width: AppConstants.iconSizeMD.sp,
                  ).fadeAnimation(),
            Spacer(),
            Center(
              child: Text(
                tital.tr(),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
