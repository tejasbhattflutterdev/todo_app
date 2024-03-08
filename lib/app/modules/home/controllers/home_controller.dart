import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_example/app/const/api_const.dart';
import 'package:todo_app_example/app/core/call_of_api/api_call.dart';
import 'package:todo_app_example/app/core/call_of_api/custom_storage.dart';
import 'package:todo_app_example/app/data/insert_to_do_modal.dart';
import 'package:todo_app_example/app/data/todo_personal_res.dart';
import 'package:todo_app_example/app/modules/conn_checker/controllers/conn_checker_controller.dart';
import 'package:todo_app_example/app/modules/todos/controllers/todos_controller.dart';
import 'package:todo_app_example/app/modules/todos/repository/to_do_repo.dart';

class HomeController extends GetxController {
  ConnCheckerController connController = Get.find<ConnCheckerController>();
  TodosController todosController = Get.put(TodosController());
  List<insert_todo_modal> tempTodoList = <insert_todo_modal>[].obs;
  TodoRepository todoRepository = TodoRepository();

  final storg = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    log('On Ready Called');
    connController.checkConnectivity();
    connController.isConnected.value == true
        ? insertDataWhenConnectionIsBack()
        : logData();
    log('On Ready Called Again');
    super.onReady();
  }

  logData() {
    log('False is called');
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAllTodoDetails() async {
    List<insert_todo_modal> insertedList =
        await TodoSharedPrefStorage.getTodos();
    log('==========================');
    log(insertedList[0].employeeId.toString());
    log(insertedList[0].managerId.toString());
    log('Length of todo list =${insertedList.length.toString()}');
    log('==========================');
    tempTodoList = insertedList;
  }

  insertDataWhenConnectionIsBack() async {
    List<insert_todo_modal> insertedList =
        await TodoSharedPrefStorage.getTodos();
    tempTodoList = insertedList;
    if (tempTodoList.isNotEmpty) {
      log('list is waiting to be inserted with length - ${tempTodoList.length}');
      log('list is to be inserted with length - ${tempTodoList.length}');
      log('list will clear - ${tempTodoList.length}');
      callApiWhenConnectionIsBack(tempTodoList);
      tempTodoList = [];
      log('=======/nlist is with length - ${tempTodoList.length}');
    } else {
      log('list is already empty');
    }
  }

  callApiWhenConnectionIsBack(
      List<insert_todo_modal> myListTobeInserted) async {
    Map<String, dynamic> toDoPostData;
    List<Map<String, dynamic>> postDataList = [];
    final toDoPostHeader = {
      'accept': 'application/json',
      'Tra-ID': storg.read('trx_id'),
      'Device-ID': 'mobile',
      'Content-Type': 'application/json'
    };

    for (int i = 0; i < tempTodoList.length; i++) {
      toDoPostData = {
        "employee_id": storg.read('EmployeeId'),
        "manager_id": 43,
        "created_date": "2024-03-09",
        "work": 'MY WORK$i',
        "deadline": tempTodoList[i].deadline,
        "completion_date": tempTodoList[i].completionDate,
        "isdeleted": tempTodoList[i].isdeleted,
        "reason": tempTodoList[i].reason,
      };

      postDataList.add(toDoPostData);
    }
    for (int i = 0; i < postDataList.length; i++) {
      await ApiCall.instance.restMainApi(
        url: '/todo/insert',
        restMethodType: MethodType.post,
        onSuccess: (data) {
          PersonalTodoResponse todoRes = PersonalTodoResponse.fromJson(data);
          storg.write('TodoWorkId', todoRes.data![0].id);
        },
        mapHeader: toDoPostHeader,
        apiData: postDataList[i],
      );
    }
    //await todoRepository.getAllPersonalTodos(id: storg.read('EmployeeId'));
    await todosController.fetchPersonalTodo(id: storg.read('EmployeeId'));
  }
}
