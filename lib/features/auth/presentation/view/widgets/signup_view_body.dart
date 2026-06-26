import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/routes/app_router.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/utils/dialogs.dart';
import 'package:fruit_hub/core/widgets/animations/r_slide_animation.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/sign_up_form.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/signup_cubit/sign_up_cubit.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.spacingMD.sp),
      child: SingleChildScrollView(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              AppDialogs.success(
                context,
                title: "success".tr(),
                message: "Account created successfully.",
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate
                },
              );
            }

            if (state is SignUpFailure) {
              AppDialogs.error(
                context,
                title: "oops".tr(),
                message: state.eMessage,
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignUpLoading ? true : false,
              child: Column(
                children: [
                  const SignUpForm()
                      .animate()
                      .shimmer(
                        delay: Duration(milliseconds: 40),
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      )
                      .fade(
                        delay: Duration(milliseconds: 60),
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),

                  // Gap(AppConstants.spacingMD.h),
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
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusXL.r,
                        ),
                        hoverColor: Theme.of(context).colorScheme.primary,
                        onTap: () => AppRouter.navigateAndRemoveUntil(
                          context,
                          Routes.login,
                        ),

                        child: Text(
                          "login".tr(),
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ).rSlideAnimation(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
