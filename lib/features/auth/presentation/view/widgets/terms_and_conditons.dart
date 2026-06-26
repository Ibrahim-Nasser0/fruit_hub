import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/constants.dart';

class TermsAndConditons extends StatefulWidget {
  const TermsAndConditons({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditons> createState() => _TermsAndConditonsState();
}

class _TermsAndConditonsState extends State<TermsAndConditons> {
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusSM.r),
          ),
          value: isAccepted,
          onChanged: (value) {
            setState(() {
              isAccepted = !isAccepted;
              widget.onChanged(isAccepted);
            });
          },
        ),

        Expanded(
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${"accepte_conditions1".tr()} ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: "accepte_conditions2".tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
