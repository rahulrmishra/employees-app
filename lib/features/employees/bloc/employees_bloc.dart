import 'package:bloc/bloc.dart';
import 'package:employees_app/features/employee_details/model/add_edit_employees_model.dart';
import 'package:employees_app/resources/shared_pref_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  EmployeesBloc() : super(const EmployeesState()) {
    on<GetEmployees>(((event, emit) async {
      final List<Employee> employees = await SharedPrefUtils.getEmployees();
      emit(state.copyWith(employees: employees));
    }));
    on<AddEmployeeInList>(((event, emit) {
      List<Employee> employees = List.from(state.employees);
      employees.add(event.employee);
      emit(state.copyWith(employees: employees));
    }));
    on<RemoveEmployee>((event, emit) async {
      try {
        await SharedPrefUtils.removeEmployee(event.employee);
        final List<Employee> employees = await SharedPrefUtils.getEmployees();
        emit(state.copyWith(
          employees: employees,
          removeEmployeeFormzStatus: FormzSubmissionStatus.success,
        ));
      } catch (e) {
        emit(state.copyWith(
          removeEmployeeFormzStatus: FormzSubmissionStatus.failure,
        ));
      }
    });
  }
}
