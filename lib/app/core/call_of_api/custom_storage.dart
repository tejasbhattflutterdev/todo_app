import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_example/app/data/insert_to_do_modal.dart';

class TodoSharedPrefStorage {
  static const String key = 'todos';

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
}
