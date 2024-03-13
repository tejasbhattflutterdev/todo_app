import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'package:todo_app_example/app/const/api_const.dart';
import 'package:todo_app_example/app/core/call_of_api/api_call.dart';
import 'package:todo_app_example/app/core/call_of_api/custom_storage.dart';
import 'package:todo_app_example/app/data/insert_to_do_modal.dart';
import 'package:todo_app_example/app/data/todo_personal_res.dart';

class TodoRepository {
  //GetStorage strg = GetStorage();
  //final strg = GetStorage();

  //TodoSharedPrefStorage myPrefs = TodoSharedPrefStorage();
  PersonalTodoResponse todoResponse = PersonalTodoResponse();

  String createdDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  final storg = GetStorage();
  Future getAllPersonalTodos({required int id}) async {
    final myGetHeader = {
      'accept': 'application/json',
      'Tra-ID': storg.read('trx_id'),
      'Device-ID': 'mobile',
    };
    final res = await ApiCall.instance.restMainApi(
      url: '/todo/get_todo_by_id/$id',
      restMethodType: MethodType.get,
      onSuccess: (sucess) {},
      mapHeader: myGetHeader,
    );

    if (res != null) {
      todoResponse = PersonalTodoResponse.fromJson(res.data);
    }
    return todoResponse;
  }

  createTodoWhenNoConnection({
    required int empId,
    required int managerId,
    required String createdDate,
    required String toDoWork,
    required String completedDate,
    //required String reason,
    required int deadLine,
    required String isDeleted,
  }) async {
    List<insert_todo_modal> data = await TodoSharedPrefStorage.getTodos();
    List<insert_todo_modal> insertedList = [];
    insertedList = [...data];
    insertedList.addAll([
      insert_todo_modal(
        completionDate: 'String completedDate',
        employeeId: storg.read('EmployeeId'),
        managerId: storg.read('offlineManagerialId'),
        work: toDoWork,
        createdDate: '2024-05-05',
        deadline: deadLine,
        isdeleted: isDeleted,
        reason: 'no reason',
      )
    ]);
    log('=========No connection todo has been inserted');
    log('=========EmployeeId ${insertedList[0].employeeId}');
    log('=========Manager Id ${insertedList[0].managerId}');
    log('=========Length Of ToDo List = ${insertedList.length.toString()}');
    TodoSharedPrefStorage.saveTodos(insertedList);

    //dataStorage.saveCustomList(insertedList);
    //todosController.listPersonalData = insertedList;
  }

  //storeDataInPrefs(List<insert_todo_modal> list) async {}

  Future createTodo({
    required int empId,
    required int managerId,
    required String createdDate,
    required String toDoWork,
    required String completedDate,
    required int deadLine,
    required String isDeleted,
  }) async {
    //List<PersonalTodoResponse> myListResponse = [];
    final toDoPostHeader = {
      'accept': 'application/json',
      'Tra-ID': storg.read('trx_id'),
      'Device-ID': 'mobile',
      'Content-Type': 'application/json'
    };

    final toDoPostData = {
      "employee_id": empId,
      "manager_id": managerId,
      "created_date": createdDate,
      "work": toDoWork,
      "deadline": deadLine,
      "completion_date": completedDate,
      "isdeleted": isDeleted,
      "reason": 'no reason',
    };

    await ApiCall.instance.restMainApi(
      url: '/todo/insert',
      restMethodType: MethodType.post,
      onSuccess: (data) {
        PersonalTodoResponse todoRes = PersonalTodoResponse.fromJson(data);
        storg.write('TodoWorkId', todoRes.data![0].id);
      },
      mapHeader: toDoPostHeader,
      apiData: toDoPostData,
    );

    //todosController.fetchPersonalTodo(id: storg.read('EmployeeId'));
    //==
    //await todosController.fetchPersonalTodo(id: storg.read('EmployeeId'));
  }

  Future deleteTodo({required int toDoId}) async {
    final toDoPostDeleteHeader = {
      'accept': 'application/json',
      'Tra-ID': storg.read('trx_id'),
      'Device-ID': 'mobile',
      'Content-Type': 'application/json'
    };

    final toDoReqBody = {
      "todo_work_id": toDoId,
      "employee_id": storg.read('EmployeeId'),
      "reason": "To be deleted"
    };

    await ApiCall.instance.restMainApi(
      url: '/todo/delete',
      restMethodType: MethodType.post,
      onSuccess: (c) {},
      mapHeader: toDoPostDeleteHeader,
      apiData: toDoReqBody,
    );
  }

  Future updateTodo({
    required int toDoId,
    required int? empId,
    required int? managerId,
    required String work,
  }) async {
    final toDoUpdateHeader = {
      'accept': 'application/json',
      'Tra-ID': storg.read('trx_id'),
      'Device-ID': 'mobile',
      'Content-Type': 'application/json'
    };

    final toDoUpdateReqData = {
      "todo_work_id": toDoId,
      "employee_id": empId ?? 43,
      "manager_id": managerId ?? 43,
      "work": work,
      "deadline": 11,
    };

    await ApiCall.instance.restMainApi(
      url: '/todo/update',
      restMethodType: MethodType.post,
      onSuccess: (sData) {},
      mapHeader: toDoUpdateHeader,
      apiData: toDoUpdateReqData,
    );
  }

  Future completionOfTodo({required int toDoId, required int empId}) async {
    final toDoPostCompletionHeader = {
      'accept': 'application/json',
      'Tra-ID': storg.read('trx_id'),
      'Device-ID': 'mobile',
      'Content-Type': 'application/json'
    };

    final toDoPostCompletionData = {
      "todo_work_id": toDoId,
      "employee_id": empId,
    };

    await ApiCall.instance.restMainApi(
      url: '/todo/completion',
      restMethodType: MethodType.post,
      onSuccess: (data) {
        //PersonalTodoResponse todoRes = PersonalTodoResponse.fromJson(data);
        //storg.write('TodoWorkId', todoRes.data![0].id);
      },
      mapHeader: toDoPostCompletionHeader,
      apiData: toDoPostCompletionData,
    );
  }
}
