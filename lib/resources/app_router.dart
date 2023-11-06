import 'package:employees_app/features/employee_details/view/employee_details_screen.dart';
import 'package:employees_app/features/no_route_found/no_screen_found.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:employees_app/features/employees/view/employees_screen.dart';
import 'package:employees_app/resources/app_route_names.dart';

class AppRouter {
  AppRouter._privateConstructor();
  static AppRouter? _instance;
  factory AppRouter() => _instance ??= AppRouter._privateConstructor();

  final router = GoRouter(
    initialLocation: AppRouteNames.employeesScreen,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRouteNames.employeesScreen,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const EmployeesScreen(),
        ),
      ),
      GoRoute(
        path: AppRouteNames.addEmployeeDetails,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: EmployeeDetailsScreen(
            title: (state.extra as Map<String, dynamic>)['title'],
            employee: (state.extra as Map<String, dynamic>)['employee'],
          ),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorScreen(
        e: state.error,
      ),
    ),
  );
}
