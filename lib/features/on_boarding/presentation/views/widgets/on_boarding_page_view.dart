import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/routes/app_router.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/theme/colors.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/on_boarding/presentation/models/page_view_item_model.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:gap/gap.dart';


class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<PageViewItemModel> onBoardingPages =
        AppConstants.onBoardingPages(context);
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: onBoardingPages.length,
            itemBuilder: (context, index) {
              return PageViewItem(
                pageController: pageController,
                pageViewItemModel: onBoardingPages[index],
              );
            },
          ),
        ),
        Gap(40.h),

        AnimatedBuilder(
          animation: pageController,
          builder: (context, child) {
            final currentPage = pageController.hasClients
                ? (pageController.page?.round() ?? 0)
                : 0;

            return Column(
              children: [
                DotsIndicator(
                  dotsCount: onBoardingPages.length,
                  position: pageController.hasClients
                      ? (pageController.page ?? 0)
                      : 0,
                  decorator: DotsDecorator(
                    activeColor: AppColors.primary,
                    color: currentPage == onBoardingPages.length - 1
                        ? AppColors.primary
                        : const Color(0xff5DB957),
                    size: const Size.square(8),
                    activeSize: const Size(18, 8),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Gap(5.h),

                Visibility(
                  visible: currentPage == onBoardingPages.length - 1,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: CustomButton(
                    width: 343.w,
                    text: 'get_started'.tr(),
                    onPressed: () =>
                        AppRouter.navigateAndRemoveUntil(context, Routes.login),
                  ),
                ),
                // Add spacing when the button is not visible
              ],
            );
          },
        ),
        Gap(40.h),
      ],
    );
  }
}
