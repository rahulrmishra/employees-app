import 'package:employees_app/features/employees/bloc/employees_bloc.dart';
import 'package:employees_app/features/employees/widgets/add_employee_button.dart';
import 'package:employees_app/features/employees/widgets/employees_list_view.dart';
import 'package:employees_app/resources/app_colors.dart';
import 'package:employees_app/resources/app_images.dart';
import 'package:employees_app/resources/app_sizes.dart';
import 'package:employees_app/resources/app_strings.dart';
import 'package:employees_app/resources/app_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.employeesList,
      ),
      body: Stack(
        children: [
          BlocBuilder<EmployeesBloc, EmployeesState>(
            builder: (context, state) {
              if (state.employees.isEmpty) {
                return Center(
                  child: Image.asset(
                    AppImages.noEmployeesFound,
                    width: 261,
                    height: 244,
                  ),
                );
              } else {
                return Column(
                  children: [
                    EmployeesListView(
                      title: AppStrings.currentEmployees,
                      employees: state.employees
                          .where((e) => e.toDate == null)
                          .toList(),
                    ),
                    EmployeesListView(
                      title: AppStrings.previousEmployees,
                      employees: state.employees
                          .where((e) => e.toDate != null)
                          .toList(),
                    ),
                    if (state.employees.isNotEmpty) ...[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 64,
                        padding: const EdgeInsets.only(
                          left: AppSizes.screenPadding,
                          top: 12,
                        ),
                        color: const Color(0xFFF2F2F2),
                        child: const Text(
                          AppStrings.swipeLeftToDelete,
                          style: TextStyle(
                            color: AppColors.textFieldHintTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ]
                  ],
                );
              }
            },
          ),
          const Positioned(
            bottom: 24,
            right: 24,
            child: AddEmployeeButton(),
          ),
        ],
      ),
    );
  }
}
