import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AppAnimations on Widget {
  Widget lSlideAnimation() {
    return animate()
        .shimmer(
          delay: Duration(milliseconds: 50),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        )
        .fade(
          delay: Duration(milliseconds: 60),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        )
        .slideX(
          begin: 0.2,
          delay: Duration(milliseconds: 60),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
        );
  }
}
