import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AppAnimations on Widget {
  Widget buttonAnimation() {
    return animate()
        .fade(delay: 100.ms, duration: 700.ms)
        .slideY(
          begin: .5,
          delay: 100.ms,
          duration: 500.ms,
          curve: Curves.easeOutQuart,
        )
        .scale(
          begin: const Offset(.7, .7),
          end: const Offset(1, 1),
          delay: 100.ms,
          duration: 500.ms,
          curve: Curves.easeOutBack,
        );
  }
}
