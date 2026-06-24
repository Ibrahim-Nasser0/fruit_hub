import 'package:flutter/material.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: OnBoardingPageView());
  }
}
