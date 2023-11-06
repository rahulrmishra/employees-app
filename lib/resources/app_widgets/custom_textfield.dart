import 'package:employees_app/resources/app_colors.dart';
import 'package:employees_app/resources/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.prefixIcon,
    this.initialValue,
    this.validator,
  });

  final String hintText;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.textInputFieldsHeight,
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        cursorColor: AppColors.borderColor,
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              AppSizes.textInputFieldsBorderRadius,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              AppSizes.textInputFieldsBorderRadius,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              AppSizes.textInputFieldsBorderRadius,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              AppSizes.textInputFieldsBorderRadius,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              AppSizes.textInputFieldsBorderRadius,
            ),
          ),
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.textFieldHintTextColor,
          ),
        ),
      ),
    );
  }
}
