import 'package:employees_app/resources/app_route_names.dart';
import 'package:employees_app/resources/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddEmployeeButton extends StatelessWidget {
  const AddEmployeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: FloatingActionButton(
        onPressed: () => context.push(
          AppRouteNames.addEmployeeDetails,
          extra: {
            'title': AppStrings.addEmployeeDetails,
          },
        ),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
