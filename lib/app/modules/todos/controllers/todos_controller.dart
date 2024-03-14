

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_example/app/data/insert_to_do_modal.dart';
import 'package:todo_app_example/app/data/todo_personal_res.dart';
import 'package:todo_app_example/app/modules/conn_checker/controllers/conn_checker_controller.dart';
import 'package:todo_app_example/app/modules/todos/repository/to_do_repo.dart';

class TodosController extends GetxController {
  RxBool isConnected = false.obs;
  GetStorage storage = GetStorage();
  TodoRepository todoRepository = TodoRepository();
  Rx<PersonalTodoResponse> toDoData = PersonalTodoResponse().obs;
  List<insert_todo_modal> listPersonalData = <insert_todo_modal>[].obs;
  List<insert_todo_modal> finalListPersonalData = <insert_todo_modal>[].obs;
  ConnCheckerController connController = Get.find();

  updateData({
    required int toDoId,
    required int empId,
    required int managerId,
    required String work,
  }) async {
    await todoRepository.updateTodo(
      toDoId: toDoId,
      empId: empId,
      managerId: managerId,
      work: work,
    );
    fetchPersonalTodo(id: storage.read('EmployeeId'));
  }

  deleteParticularTodo({required int todoWorkId}) async {
    await todoRepository.deleteTodo(toDoId: todoWorkId);
    fetchPersonalTodo(id: storage.read('EmployeeId'));
  }

  completionTodo({required int myTodoId, required int myEmpId}) async {
    await todoRepository.completionOfTodo(
      toDoId: myTodoId,
      empId: myEmpId,
    );
    fetchPersonalTodo(id: storage.read('EmployeeId'));
  }

  // Future createTodoWhenNoInternet() async {
  //   storage.write('listPersonalData', listPersonalData);
  // }

  insertTodo(
      {required int empid,
      required int manageId,
      required String completedDate,
      required String createdDate,
      required String wrk,
      required int deadLine,
      required String isDeleted}) async {
    if (connController.isConnected.value == true) {
      await todoRepository.createTodo(
        deadLine: deadLine,
        empId: empid,
        managerId: manageId,
        completedDate: completedDate,
        createdDate: createdDate,
        toDoWork: wrk,
        isDeleted: isDeleted,
      );
      fetchPersonalTodo(id: storage.read('EmployeeId'));
    } else {
      todoRepository.createTodoWhenNoConnection(
        empId: empid,
        managerId: manageId,
        createdDate: createdDate,
        toDoWork: wrk,
        completedDate: completedDate,
        deadLine: deadLine,
        isDeleted: isDeleted,
      );
    }
    //update();
    //fetchPersonalTodo(id: storage.read('EmployeeId'));
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
    //checkConnectivity();
    //connController.checkConnectivity();
    // connController.isConnected.listen((connection) {
    //   if (connection) {}
    // });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void checkConnectivity() {
  //   Connectivity().onConnectivityChanged.listen(
  //     (ConnectivityResult result) {
  //       if (result == ConnectivityResult.wifi ||
  //           result == ConnectivityResult.mobile) {
  //         isConnected.value = true;
  //         Get.dialog(AlertDialog(
  //           title: Text('Internet is back'),
  //           content: Text('You are connected to the internet.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Get.back();
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         ));
  //       } else {
  //         isConnected.value = false;
  //       }
  //     },
  //   );
  // }
}
