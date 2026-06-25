import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/routes/app_router.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      AppRouter.navigateAndReplace(context, Routes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(AppImages.plant),
              )
              .animate()
              .fade(duration: 1200.ms, curve: Curves.easeOut)
              .slideX(
                begin: -0.4,
                duration: 1200.ms,
                curve: Curves.easeOutCubic,
              ),

          Image.asset(AppImages.appLogo, width: 178.w, height: 173.h)
              .animate()
              .fade(delay: 700.ms, duration: 1500.ms)
              .slideY(
                begin: .5,
                delay: 700.ms,
                duration: 1500.ms,
                curve: Curves.easeOutQuart,
              )
              .scale(
                begin: const Offset(.7, .7),
                end: const Offset(1, 1),
                delay: 700.ms,
                duration: 1500.ms,
                curve: Curves.easeOutBack,
              ),

          SvgPicture.asset(AppImages.splashBottom, width: 379.w, height: 156.h)
              .animate()
              .fade(delay: 1500.ms, duration: 1300.ms)
              .slideY(
                begin: 1,
                delay: 1500.ms,
                duration: 1300.ms,
                curve: Curves.easeOutCubic,
              ),
        ],
      ),
    );
  }
}
