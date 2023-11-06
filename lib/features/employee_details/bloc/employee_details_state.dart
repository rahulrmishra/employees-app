part of 'employee_details_bloc.dart';

class EmployeeDetailsState extends Equatable {
  const EmployeeDetailsState({
    required this.employee,
    this.addEmpFormzStatus = FormzSubmissionStatus.initial,
    this.updateEmpFormzStatus = FormzSubmissionStatus.initial,
    this.removeEmpFormzStatus = FormzSubmissionStatus.initial,
  });
  final Employee employee;
  final FormzSubmissionStatus addEmpFormzStatus;
  final FormzSubmissionStatus updateEmpFormzStatus;
  final FormzSubmissionStatus removeEmpFormzStatus;

  @override
  List<Object> get props => [
        employee,
        addEmpFormzStatus,
        updateEmpFormzStatus,
        removeEmpFormzStatus,
      ];

  EmployeeDetailsState copyWith({
    Employee? employee,
    FormzSubmissionStatus? addEmpFormzStatus,
    FormzSubmissionStatus? updateEmpFormzStatus,
    FormzSubmissionStatus? removeEmpFormzStatus,
  }) {
    return EmployeeDetailsState(
      employee: employee ?? this.employee,
      addEmpFormzStatus: addEmpFormzStatus ?? FormzSubmissionStatus.initial,
      updateEmpFormzStatus:
          updateEmpFormzStatus ?? FormzSubmissionStatus.initial,
      removeEmpFormzStatus:
          removeEmpFormzStatus ?? FormzSubmissionStatus.initial,
    );
  }

  @override
  bool get stringify => true;
}
