import 'package:flutter/material.dart';
import 'package:employees_app/resources/app_colors.dart';
import 'package:employees_app/resources/app_images.dart';
import 'package:employees_app/resources/app_sizes.dart';
import 'package:employees_app/resources/app_strings.dart';
import 'package:employees_app/resources/app_widgets/custom_image.dart';

class SelectRoleDropDown extends StatelessWidget {
  const SelectRoleDropDown({
    super.key,
    required this.onTap,
    this.value,
  });
  final Function()? onTap;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: AppSizes.textInputFieldsHeight,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.borderColor,
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            AppAssetIcon(name: AppImages.briefcase),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                value ?? AppStrings.selectRole,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: value == null
                      ? AppColors.textFieldHintTextColor
                      : AppColors.black,
                ),
              ),
            ),
            AppAssetIcon(name: AppImages.dropdown),
          ],
        ),
      ),
    );
  }
}
