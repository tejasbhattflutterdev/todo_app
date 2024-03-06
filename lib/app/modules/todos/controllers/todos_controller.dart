import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_example/app/data/todo_personal_res.dart';
import 'package:todo_app_example/app/modules/todos/repository/to_do_repo.dart';

class TodosController extends GetxController {
  GetStorage storage = GetStorage();
  TodoRepository todoRepository = TodoRepository();
  Rx<PersonalTodoResponse> toDoData = PersonalTodoResponse().obs;

  updateData(
      {required int toDoId, required int empId, required int managerId}) async {
    await todoRepository.updateTodo(
        toDoId: toDoId, empId: empId, managerId: managerId);
    fetchPersonalTodo(id: storage.read('EmployeeId'));
  }

  deleteParticularTodo({required int todoWorkId}) async {
    await todoRepository.deleteTodo(toDoId: todoWorkId);
    fetchPersonalTodo(id: storage.read('EmployeeId'));
  }

  insertTodo() async {
    await todoRepository.createTodo();
    fetchPersonalTodo(id: storage.read('EmployeeId'));
  }

  fetchPersonalTodo({required int id}) async {
    final eTodoData = await todoRepository.getAllPersonalTodos(id: id);
    if (eTodoData != null) {
      toDoData.value = eTodoData;
      // update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPersonalTodo(id: storage.read('EmployeeId'));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}