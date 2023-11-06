import 'dart:convert';

import 'package:equatable/equatable.dart';

const List<String> employeeRoles = [
  'Product Designer',
  'Flutter Developer',
  'QA Tester',
  'Product Owner'
];

class Employee extends Equatable {
  final String? name;
  final String? role;
  final String? fromDate;
  final String? toDate;
  final String? id;

  const Employee({
    this.name,
    this.role,
    this.fromDate,
    this.toDate,
    required this.id,
  });

  Employee copyWith({
    String? name,
    String? role,
    String? fromDate,
    String? toDate,
    bool setToDateNull = false,
  }) {
    return Employee(
      id: id,
      name: name ?? this.name,
      role: role ?? this.role,
      fromDate: fromDate ?? this.fromDate,
      toDate: setToDateNull ? null : toDate ?? this.toDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'role': role,
      'fromDate': fromDate,
      'toDate': toDate,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] as String?,
      name: map['name'] as String?,
      role: map['role'] as String?,
      fromDate: map['fromDate'] as String?,
      toDate: map['toDate'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        name,
        role,
        fromDate,
        toDate,
        id,
      ];
}
