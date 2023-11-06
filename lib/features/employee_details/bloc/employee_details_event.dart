part of 'employee_details_bloc.dart';

sealed class EmployeeDetailsEvent extends Equatable {
  const EmployeeDetailsEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseEmployeeDetails extends EmployeeDetailsEvent {
  const InitialiseEmployeeDetails({required this.employee});
  final Employee? employee;

  @override
  List<Object?> get props => [employee];
}

class ChangeEmployeeName extends EmployeeDetailsEvent {
  const ChangeEmployeeName({required this.name});
  final String name;

  @override
  List<Object> get props => [name];
}

class ChangeEmployeeRole extends EmployeeDetailsEvent {
  const ChangeEmployeeRole({required this.role});
  final String role;

  @override
  List<Object> get props => [role];
}

class ChangeEmployeeToDate extends EmployeeDetailsEvent {
  const ChangeEmployeeToDate({required this.toDate});
  final String toDate;

  @override
  List<Object> get props => [toDate];
}

class ChangeEmployeeFromDate extends EmployeeDetailsEvent {
  const ChangeEmployeeFromDate({required this.fromDate});
  final String fromDate;

  @override
  List<Object> get props => [fromDate];
}

class SaveEmployeeDetails extends EmployeeDetailsEvent {
  const SaveEmployeeDetails();
}

class UpdateEmployeeDetails extends EmployeeDetailsEvent {
  const UpdateEmployeeDetails();
}

class DeleteEmployeeDetails extends EmployeeDetailsEvent {
  const DeleteEmployeeDetails();
}
