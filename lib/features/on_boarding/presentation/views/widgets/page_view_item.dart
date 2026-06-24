import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/routes/app_router.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/features/on_boarding/presentation/models/page_view_item_model.dart';
import 'package:gap/gap.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.pageViewItemModel,

    required this.pageController,
  });
  final PageViewItemModel pageViewItemModel;

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  pageViewItemModel.backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              (pageController.page ?? 0).round() == 0.0
                  ? Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: TextButton(
                        onPressed: () => AppRouter.navigateAndRemoveUntil(
                          context,
                          Routes.login,
                        ),

                        child:
                            Text(
                                  'skip'.tr(),
                                  style: Theme.of(context).textTheme.labelLarge,
                                )
                                .animate()
                                .fade(delay: 100.ms, duration: 400.ms)
                                .slideY(
                                  begin: .5,
                                  delay: 100.ms,
                                  duration: 400.ms,
                                  curve: Curves.easeOutQuart,
                                ),
                      ),
                    )
                  : SizedBox.shrink(),
              Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width * 0.5 - 137.w,
                child:
                    SvgPicture.asset(
                          pageViewItemModel.iconImage,
                          width: 274.w,
                          height: 267.h,
                        )
                        .animate()
                        .fade(delay: 100.ms, duration: 400.ms)
                        .slideY(
                          begin: .5,
                          delay: 100.ms,
                          duration: 400.ms,
                          curve: Curves.easeOutQuart,
                        )
                        .scale(
                          begin: const Offset(.7, .7),
                          end: const Offset(1, 1),
                          delay: 100.ms,
                          duration: 400.ms,
                          curve: Curves.easeOutBack,
                        ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(35.h),
              pageViewItemModel.title,
              Gap(8.h),
              Text(
                    pageViewItemModel.subtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                  .animate()
                  .fade(delay: 100.ms, duration: 400.ms)
                  .slideY(
                    begin: .5,
                    delay: 100.ms,
                    duration: 400.ms,
                    curve: Curves.easeOutQuart,
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
