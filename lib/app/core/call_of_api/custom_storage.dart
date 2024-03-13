import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_example/app/data/employee_modal.dart';
import 'package:todo_app_example/app/data/insert_to_do_modal.dart';

class TodoSharedPrefStorage {
  static const String key = 'todos';
  static const String _employeeKey = 'employeeData';
  // Save todos list to shared preferences
  static Future<void> saveTodos(List<insert_todo_modal> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTodos = todos.map((todo) => todo.toJson()).toList();
    await prefs.setString(key, jsonEncode(jsonTodos));
  }

  // Get todos list from shared preferences
  static Future<List<insert_todo_modal>> getTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTodos = prefs.getString(key);
    if (jsonTodos != null) {
      final Iterable decoded = jsonDecode(jsonTodos);
      return decoded.map((todo) => insert_todo_modal.fromJson(todo)).toList();
    }
    return [];
  }

  // Store employee data to SharedPreferences
  static Future<void> saveEmployeeData(EmployeeModal employee) async {
    if (employee.data != null && employee.data!.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonString = jsonEncode(employee.toJson());
      await prefs.setString(_employeeKey, jsonString);
    }
  }

  // Retrieve employee data from SharedPreferences
  static Future<EmployeeModal?> getEmployeeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_employeeKey);
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return EmployeeModal.fromJson(jsonMap);
    }
    return null;
  }
}
