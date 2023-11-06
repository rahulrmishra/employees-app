import 'package:employees_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static void showMySnackBar({
    required BuildContext context,
    required String message,
    SnackBarBehavior? behavior,
    int sec = 2,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: behavior,
        backgroundColor: AppColors.lightBlack,
        content: Text(message, style: const TextStyle(color: AppColors.white)),
        duration: Duration(seconds: sec),
      ),
    );
  }
}
