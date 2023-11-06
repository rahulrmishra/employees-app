part of 'employees_bloc.dart';

class EmployeesState extends Equatable {
  const EmployeesState({
    this.employees = const [],
    this.removeEmployeeFormzStatus = FormzSubmissionStatus.initial,
  });

  final List<Employee> employees;
  final FormzSubmissionStatus removeEmployeeFormzStatus;

  @override
  List<Object> get props => [employees, removeEmployeeFormzStatus];

  EmployeesState copyWith({
    List<Employee>? employees,
    FormzSubmissionStatus? removeEmployeeFormzStatus,
  }) {
    return EmployeesState(
      employees: employees ?? this.employees,
      removeEmployeeFormzStatus:
          removeEmployeeFormzStatus ?? FormzSubmissionStatus.initial,
    );
  }
}
