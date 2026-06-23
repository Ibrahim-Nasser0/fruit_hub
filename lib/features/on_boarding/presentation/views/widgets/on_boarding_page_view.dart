import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/colors.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:gap/gap.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: AppConstants.onBoardingPages.length,
            itemBuilder: (context, index) {
              return PageViewItem(
                pageController: widget.pageController,
                pageViewItemModel: AppConstants.onBoardingPages[index],
        
              );
            },
          ),
        ),
        Gap(60.h),

        AnimatedBuilder(
          animation: widget.pageController,
          builder: (context, child) {
            final currentPage = widget.pageController.hasClients
                ? (widget.pageController.page?.round() ?? 0)
                : 0;

            return Column(
              children: [
                DotsIndicator(
                  dotsCount: AppConstants.onBoardingPages.length,
                  position: widget.pageController.hasClients
                      ? (widget.pageController.page ?? 0)
                      : 0,
                  decorator: DotsDecorator(
                    activeColor: AppColors.primary,
                    color: const Color(0xff5DB957),
                    size: const Size.square(8),
                    activeSize: const Size(18, 8),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Gap(5.h),
                if (currentPage == AppConstants.onBoardingPages.length - 1)
                  CustomButton(
                    width: 343.w,
                    text: 'get_started'.tr(),
                    onPressed: () {
                      // Navigate to the next screen
                    },
                  )
                else
                  SizedBox(
                    height: 55,
                  ), // Add spacing when the button is not visible
              ],
            );
          },
        ),
        Gap(40.h),
      ],
    );
  }
}
