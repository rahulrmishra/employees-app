import 'package:bloc/bloc.dart';
import 'package:employees_app/features/employee_details/model/add_edit_employees_model.dart';
import 'package:employees_app/resources/shared_pref_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:uuid/uuid.dart';

part 'employee_details_event.dart';
part 'employee_details_state.dart';

class EmployeeDetailsBloc
    extends Bloc<EmployeeDetailsEvent, EmployeeDetailsState> {
  EmployeeDetailsBloc()
      : super(
          EmployeeDetailsState(employee: Employee(id: const Uuid().v4())),
        ) {
    on<ChangeEmployeeName>((event, emit) {
      emit(
        state.copyWith(employee: state.employee.copyWith(name: event.name)),
      );
    });
    on<ChangeEmployeeFromDate>((event, emit) {
      emit(
        state.copyWith(
            employee: state.employee.copyWith(fromDate: event.fromDate)),
      );
    });
    on<ChangeEmployeeToDate>((event, emit) {
      emit(
        state.copyWith(employee: state.employee.copyWith(toDate: event.toDate)),
      );
    });
    on<ChangeEmployeeRole>((event, emit) {
      emit(
        state.copyWith(employee: state.employee.copyWith(role: event.role)),
      );
    });
    on<InitialiseEmployeeDetails>((event, emit) {
      if (event.employee != null) {
        emit(state.copyWith(employee: event.employee));
      }
    });
    on<SaveEmployeeDetails>((event, emit) async {
      try {
        await SharedPrefUtils.addEmployee(state.employee);
        emit(state.copyWith(addEmpFormzStatus: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(addEmpFormzStatus: FormzSubmissionStatus.failure));
      }
    });
    on<UpdateEmployeeDetails>((event, emit) async {
      try {
        await SharedPrefUtils.updateEmployee(state.employee);
        emit(state.copyWith(
            updateEmpFormzStatus: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(
            updateEmpFormzStatus: FormzSubmissionStatus.failure));
      }
    });
    on<DeleteEmployeeDetails>((event, emit) async {
      try {
        await SharedPrefUtils.removeEmployee(state.employee);
        emit(state.copyWith(
            removeEmpFormzStatus: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(
            removeEmpFormzStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
