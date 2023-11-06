import 'package:employees_app/features/employees/bloc/employees_bloc.dart';
import 'package:employees_app/resources/app_colors.dart';
import 'package:employees_app/resources/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeesBloc()..add(const GetEmployees()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Employees App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        routerConfig: _router.router,
      ),
    );
  }
}
