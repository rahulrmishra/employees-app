import 'package:employees_app/features/employee_details/model/add_edit_employees_model.dart';
import 'package:employees_app/features/employees/bloc/employees_bloc.dart';
import 'package:employees_app/resources/app_colors.dart';
import 'package:employees_app/resources/app_images.dart';
import 'package:employees_app/resources/app_route_names.dart';
import 'package:employees_app/resources/app_sizes.dart';
import 'package:employees_app/resources/app_strings.dart';
import 'package:employees_app/resources/app_widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EmployeesListView extends StatelessWidget {
  const EmployeesListView({
    super.key,
    required this.title,
    required this.employees,
  });

  final String title;
  final List<Employee> employees;

  String formatDate(String? dateStr) {
    if (dateStr == null) {
      return '';
    } else {
      final monthNames = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ];
      DateTime date = DateTime.parse(dateStr);
      final formattedDate =
          '${date.day} ${monthNames[date.month - 1]}, ${date.year}';
      return formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(AppSizes.screenPadding),
            color: AppColors.borderColor,
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.screenPadding,
                right: AppSizes.screenPadding,
                bottom: AppSizes.screenPadding,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: employees.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: AppColors.borderColor,
                    height: 1.0,
                  );
                },
                itemBuilder: (_, index) {
                  final Employee emp = employees[index];
                  return InkWell(
                    onTap: () => context.push(
                      AppRouteNames.addEmployeeDetails,
                      extra: {
                        'title': AppStrings.editEmployeeDetails,
                        'employee': emp,
                      },
                    ),
                    child: Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        context
                            .read<EmployeesBloc>()
                            .add(RemoveEmployee(employee: emp));
                      },
                      background: Container(
                        color: AppColors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: AppAssetIcon(
                          onTap: null,
                          name: AppImages.delete,
                          iconColor: AppColors.white,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            emp.name ?? '',
                            style: const TextStyle(
                              color: Color(0xFF323238),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            emp.role ?? '',
                            style: const TextStyle(
                              color: AppColors.textFieldHintTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            emp.toDate == null
                                ? 'From ${formatDate(emp.fromDate)}'
                                : '${formatDate(emp.fromDate)} - ${formatDate(emp.toDate!)}',
                            style: const TextStyle(
                              color: AppColors.textFieldHintTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
