import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_example/app/const/api_const.dart';
import 'package:todo_app_example/app/core/call_of_api/api_call.dart';
import 'package:todo_app_example/app/data/response_modal.dart';
import 'package:todo_app_example/app/modules/home/views/home_view.dart';
import 'package:todo_app_example/app/routes/app_pages.dart';

class AuthenticationRpository {
  final myPostHader = {
    'Content-Type': 'application/json',
    'Device-ID': 'mobile',
    'accept': 'application/json'
  };

  // for login
  final loginResponseData = GetStorage();
  Future login({
    required String email,
    required String password,
  }) async {
    final data = {
      'Email': email,
      'password': password,
    };
    ApiCall.instance.restMainApi(
      mapHeader: myPostHader,
      restMethodType: MethodType.post,
      apiData: data,
      url: '/employee/login',
      onSuccess: (mapValues) {
        // log(mapValues['data']['0']['trx_id']);
        LoginResponseModal model = LoginResponseModal.fromJson(mapValues);
        log('STRING - Name${model.data!.first.name!}');
        loginResponseData.write('EmployeeName', model.data?.first.name!);
        loginResponseData.write('EmployeeId', model.data?.first.employeeId);
        loginResponseData.write('PostId', model.data?.first.postId);
        loginResponseData.write('Post_Name', model.data?.first.postName);
        loginResponseData.write('trx_id', model.data?.first.trxId);
        log('Transaction ID ' + loginResponseData.read('trx_id'));
        Get.offAll(() => HomeView());
      },
    );
  }

  Future logout({
    required int empId,
  }) async {
    final myLogoutHeader = {
      'Content-Type': 'application/json',
      'Device-ID': 'mobile',
      'accept': 'application/json',
      'Tra-ID': loginResponseData.read('trx_id')
    };

    final data = {
      'employee_id': empId,
    };
    ApiCall.instance.restMainApi(
      mapHeader: myLogoutHeader,
      restMethodType: MethodType.post,
      apiData: data,
      url: '/employee/logout',
      onSuccess: (mapValues) {},
    );
  }
}
