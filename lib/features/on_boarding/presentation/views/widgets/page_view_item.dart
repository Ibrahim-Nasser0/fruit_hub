import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
                      padding: const EdgeInsets.all(30.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'skip'.tr(),
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width * 0.5 - 137.w,
                child: SvgPicture.asset(
                  pageViewItemModel.iconImage,
                  width: 274.w,
                  height: 267.h,
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
              const SizedBox(height: 8),
              Text(
                pageViewItemModel.subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
