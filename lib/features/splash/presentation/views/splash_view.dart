import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    executeNaviagtion();
    super.initState();
  }

  void executeNaviagtion() {
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Routes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .spaceBetween,
        children: [
          SvgPicture.asset(AppImages.plant),

          Center(
            child: Image.asset(AppImages.appLogo, width: 178.w, height: 173.h),
          ),

          SvgPicture.asset(AppImages.splashBottom, width: 379.w, height: 156.h),
        ],
      ),
    );
  }
}
