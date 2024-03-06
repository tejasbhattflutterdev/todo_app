import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_example/app/const/api_const.dart';
import 'package:todo_app_example/app/core/call_of_api/api_call.dart';
import 'package:todo_app_example/app/data/todo_personal_res.dart';

class TodoRepository {
  //GetStorage strg = GetStorage();
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

  Future createTodo() async {
    final toDoPostHeader = {
      'accept': 'application/json',
      'Tra-ID': storg.read('trx_id'),
      'Device-ID': 'mobile',
      'Content-Type': 'application/json'
    };

    final toDoPostData = {
      "employee_id": storg.read('EmployeeId'),
      "manager_id": 43,
      "created_date": createdDate,
      "work": "work to be post",
      "deadline": 10,
      "completion_date": "2025-02-09",
      "isdeleted": "false",
      "reason": "reason"
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
    required int empId,
    required int managerId,
  }) async {
    final toDoUpdateHeader = {
      'accept': 'application/json',
      'Tra-ID': storg.read('trx_id'),
      'Device-ID': 'mobile',
      'Content-Type': 'application/json'
    };

    final toDoUpdateReqData = {
      "todo_work_id": toDoId,
      "employee_id": storg.read('EmployeeId'),
      "manager_id": managerId,
      "work": "First Work",
      "deadline": 5110
    };

    await ApiCall.instance.restMainApi(
      url: '/todo/update',
      restMethodType: MethodType.post,
      onSuccess: (sData) {},
      mapHeader: toDoUpdateHeader,
      apiData: toDoUpdateReqData,
    );
  }
}
