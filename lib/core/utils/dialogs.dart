import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../widgets/custom_dialog.dart';

class AppDialogs {
  static void success(
    BuildContext context, {
    required String title,
    required String message,
    VoidCallback? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (_) => CustomDialog(
        title: title,
        message: message,
        icon: Icons.check_circle,
        iconColor: Colors.green,
        onPressed: onPressed,
      ),
    );
  }

  static void error(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (_) => CustomDialog(
        title: title,
        message: message,
        icon: Icons.error,
        iconColor: Colors.red,
      ),
    );
  }

  static void loading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        contentPadding: EdgeInsets.all(24.r),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                  width: 55.w,
                  height: 55.w,
                  child: const CircularProgressIndicator(strokeWidth: 3),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .scale(
                  begin: const Offset(.9, .9),
                  end: const Offset(1.05, 1.05),
                  duration: 800.ms,
                  curve: Curves.easeInOut,
                ),

            Gap(20.h),

            Text(
              'loading'.tr(),
              style: Theme.of(context).textTheme.displayMedium,
            ),

            Gap(12.h),

            Text(
              'please_wait'.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ).animate().scale(duration: 300.ms, curve: Curves.easeOutBack).fade(),
      ),
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
