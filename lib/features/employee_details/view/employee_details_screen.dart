import 'package:employees_app/features/employee_details/bloc/employee_details_bloc.dart';
import 'package:employees_app/features/employee_details/model/add_edit_employees_model.dart';
import 'package:employees_app/features/employee_details/widgets/add_employees_bottom_nav_bar.dart';
import 'package:employees_app/features/employee_details/widgets/select_role_dropdown.dart';
import 'package:employees_app/features/employees/bloc/employees_bloc.dart';
import 'package:employees_app/resources/app_colors.dart';
import 'package:employees_app/resources/app_images.dart';
import 'package:employees_app/resources/app_sizes.dart';
import 'package:employees_app/resources/app_strings.dart';
import 'package:employees_app/resources/app_utils.dart';
import 'package:employees_app/resources/app_widgets/custom_app_bar.dart';
import 'package:employees_app/resources/app_widgets/custom_image.dart';
import 'package:employees_app/resources/app_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  const EmployeeDetailsScreen({
    super.key,
    required this.title,
    this.employee,
  });

  final String title;
  final Employee? employee;

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initialiseEmployeeDetails();
  }

  void initialiseEmployeeDetails() {
    if (widget.employee == null) return;
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext _) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: employeeRoles.length,
          separatorBuilder: (context, index) {
            return const Divider(
              color: AppColors.borderColor,
              height: 1.0,
            );
          },
          itemBuilder: (_, index) {
            final e = employeeRoles[index];
            return ListTile(
              title: Center(
                child: Text(e),
              ),
              onTap: () {
                context
                    .read<EmployeeDetailsBloc>()
                    .add(ChangeEmployeeRole(role: e));
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }

  void listenStateChanges(BuildContext context, EmployeeDetailsState state) {
    switch (state.addEmpFormzStatus) {
      case FormzSubmissionStatus.success:
        handleAddEmployeeSuccess(context, state.employee);
        break;
      case FormzSubmissionStatus.failure:
        showErrorMessage(context);
        break;
      default:
        break;
    }

    switch (state.updateEmpFormzStatus) {
      case FormzSubmissionStatus.success:
        handleUpdateEmployeeSuccess(context);
        break;
      case FormzSubmissionStatus.failure:
        showErrorMessage(context);
        break;
      default:
        break;
    }

    switch (state.removeEmpFormzStatus) {
      case FormzSubmissionStatus.success:
        handleRemoveEmployeeSuccess(context);
        break;
      case FormzSubmissionStatus.failure:
        showErrorMessage(context);
        break;
      default:
        break;
    }
  }

  void handleAddEmployeeSuccess(BuildContext context, Employee employee) {
    AppUtils.showMySnackBar(
      context: context,
      message: AppStrings.employeeAddedSuccessfully,
    );

    context.read<EmployeesBloc>().add(AddEmployeeInList(employee: employee));

    GoRouter.of(context).pop();
  }

  void handleUpdateEmployeeSuccess(BuildContext context) {
    AppUtils.showMySnackBar(
      context: context,
      message: AppStrings.employeeUpdatedSuccessfully,
    );
    context.read<EmployeesBloc>().add(const GetEmployees());
    GoRouter.of(context).pop();
  }

  void handleRemoveEmployeeSuccess(BuildContext context) {
    AppUtils.showMySnackBar(
      context: context,
      message: AppStrings.employeeRemovedSuccessfully,
    );
    context.read<EmployeesBloc>().add(const GetEmployees());
    GoRouter.of(context).pop();
  }

  void showErrorMessage(BuildContext context) {
    AppUtils.showMySnackBar(
      context: context,
      message: AppStrings.somethingWentWrong,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeDetailsBloc()
        ..add(InitialiseEmployeeDetails(employee: widget.employee)),
      child: BlocListener<EmployeeDetailsBloc, EmployeeDetailsState>(
        listener: (_, state) {
          listenStateChanges(context, state);
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: CustomAppBar(
                title: widget.title,
                actions: widget.employee != null
                    ? [
                        Padding(
                          padding: const EdgeInsets.all(AppSizes.screenPadding),
                          child: AppAssetIcon(
                            onTap: () => context
                                .read<EmployeeDetailsBloc>()
                                .add(const DeleteEmployeeDetails()),
                            name: AppImages.delete,
                            iconColor: AppColors.white,
                          ),
                        )
                      ]
                    : null,
              ),
              body: Padding(
                padding: const EdgeInsets.all(AppSizes.screenPadding),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    children: [
                      BlocBuilder<EmployeeDetailsBloc, EmployeeDetailsState>(
                        builder: (context, state) {
                          return CustomTextField(
                            initialValue: widget.employee?.name ?? '',
                            hintText: AppStrings.employeeName,
                            validator: (p0) {
                              if (p0 == null || p0.trim().isEmpty) {
                                return AppStrings.thisFieldIsRequired;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              context
                                  .read<EmployeeDetailsBloc>()
                                  .add(ChangeEmployeeName(name: value));
                            },
                            prefixIcon: AppAssetIcon(
                              name: AppImages.personIcon,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 23),
                      BlocBuilder<EmployeeDetailsBloc, EmployeeDetailsState>(
                        buildWhen: (previous, current) =>
                            previous.employee.role != current.employee.role,
                        builder: (context, state) {
                          return SelectRoleDropDown(
                            onTap: () => showBottomSheet(context),
                            value: state.employee.role,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: AddEmployeesBottomNavBar(
                addNewEmployee: widget.employee == null,
              ),
            );
          },
        ),
      ),
    );
  }
}
