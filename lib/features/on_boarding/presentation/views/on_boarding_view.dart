import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OnBoarding', style: TextStyle(fontSize: 18.sp)),
      ),
      body: Center(
        child: Text('OnBoarding Feature', style: TextStyle(fontSize: 24.sp)),
      ),
    );
  }
}
