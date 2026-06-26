
import 'package:flutter/material.dart';

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
      builder: (_) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
