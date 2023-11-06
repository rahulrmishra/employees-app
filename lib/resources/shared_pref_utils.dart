import 'package:employees_app/features/employee_details/model/add_edit_employees_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  // ignore: constant_identifier_names
  static const EMPLOYEES = 'employees';

  static Future<List<Employee>> getEmployees() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? employeesJson = prefs.getStringList(EMPLOYEES);

    final List<Employee> employees = employeesJson?.map((jsonString) {
          return Employee.fromJson(jsonString);
        }).toList() ??
        [];
    return employees;
  }

  static Future<void> addEmployee(Employee employee) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<Employee> employees = await getEmployees();
    employees.add(employee);

    final List<String> updatedEmployeesJson = employees.map((employee) {
      return employee.toJson();
    }).toList();

    await prefs.setStringList(EMPLOYEES, updatedEmployeesJson);
  }

  static Future<void> removeEmployee(Employee employee) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Employee> employees = await getEmployees();
    employees.removeWhere((e) => e.id == employee.id);
    final List<String> updatedEmployeesJson = employees.map((employee) {
      return employee.toJson();
    }).toList();

    await prefs.setStringList(EMPLOYEES, updatedEmployeesJson);
  }

  static Future<void> updateEmployee(Employee updatedEmployee) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<Employee> employees = await getEmployees();

    int employeeIndex = employees.indexWhere(
      (employee) => employee.id == updatedEmployee.id,
    );

    if (employeeIndex != -1) {
      employees[employeeIndex] = updatedEmployee;

      final List<String> updatedEmployeesJson = employees.map((employee) {
        return employee.toJson();
      }).toList();

      await prefs.setStringList(EMPLOYEES, updatedEmployeesJson);
    }
  }
}
