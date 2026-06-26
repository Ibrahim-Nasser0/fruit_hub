import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/animations/button_animation.dart';
import 'package:gap/gap.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    required this.iconColor,
    this.buttonText = 'ok',
    this.onPressed,
  });

  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      contentPadding: const EdgeInsets.all(24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
                radius: 35.r,
                backgroundColor: iconColor.withOpacity(.15),
                child: Icon(icon, size: 40.sp, color: iconColor),
              )
              .animate(autoPlay: true)
              .tada(
                delay: 500.ms,
                duration: 1000.ms,
                infinite: true,
                curve: Curves.linear,
              ),
          Gap(20.h),

          Text(title.tr(), style: Theme.of(context).textTheme.displayMedium),

          Gap(12.h),

          Text(
            message.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          Gap(24.h),

          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed:
                  onPressed ??
                  () {
                    Navigator.pop(context);
                  },
              child: Text(
                buttonText.tr(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ).buttonAnimation(),
        ],
      ).animate().scale(duration: 300.ms, curve: Curves.easeOutBack).fade(),
    );
  }
}
