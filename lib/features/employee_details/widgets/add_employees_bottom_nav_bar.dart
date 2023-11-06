import 'package:employees_app/features/employee_details/bloc/employee_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:employees_app/resources/app_colors.dart';
import 'package:employees_app/resources/app_strings.dart';
import 'package:employees_app/resources/app_widgets/custom_app_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddEmployeesBottomNavBar extends StatelessWidget {
  const AddEmployeesBottomNavBar({
    super.key,
    required this.addNewEmployee,
  });
  final bool addNewEmployee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 64,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.bottomNavBarTopBorderColor,
              width: 2.0,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomAppButton(
              onTap: () => context.pop(),
              lable: AppStrings.cancel,
              buttonTextColor: AppColors.primaryColor,
              backgroundColor: AppColors.lightBlueColor,
            ),
            const SizedBox(width: 16),
            CustomAppButton(
              onTap: () {
                if (addNewEmployee) {
                  context
                      .read<EmployeeDetailsBloc>()
                      .add(const SaveEmployeeDetails());
                } else {
                  context
                      .read<EmployeeDetailsBloc>()
                      .add(const UpdateEmployeeDetails());
                }
              },
              lable: AppStrings.save,
            ),
          ],
        ),
      ),
    );
  }
}
