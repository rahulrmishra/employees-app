part of 'employees_bloc.dart';

sealed class EmployeesEvent extends Equatable {
  const EmployeesEvent();

  @override
  List<Object> get props => [];
}

class GetEmployees extends EmployeesEvent {
  const GetEmployees();

  @override
  List<Object> get props => [];
}

class AddEmployeeInList extends EmployeesEvent {
  const AddEmployeeInList({required this.employee});
  final Employee employee;

  @override
  List<Object> get props => [employee];
}

class RemoveEmployee extends EmployeesEvent {
  const RemoveEmployee({required this.employee});
  final Employee employee;

  @override
  List<Object> get props => [employee];
}
