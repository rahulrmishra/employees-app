import 'package:employees_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppAssetIcon extends StatelessWidget {
  const AppAssetIcon({
    super.key,
    required this.name,
    this.iconColor,
    this.onTap,
  });
  final String name;
  final Color? iconColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        name,
        height: 24,
        width: 24,
        color: iconColor ?? AppColors.primaryColor,
      ),
    );
  }
}
