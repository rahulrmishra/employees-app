import 'package:employees_app/resources/app_colors.dart';
import 'package:employees_app/resources/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.onTap,
    required this.lable,
    this.backgroundColor = AppColors.primaryColor,
    this.buttonTextColor = AppColors.white,
  });
  final Function()? onTap;
  final String lable;
  final Color backgroundColor;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.buttonHeight,
      width: AppSizes.buttonWidth,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppSizes.customButtonBorderRadius,
              ),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          lable,
          style: TextStyle(
            color: buttonTextColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
