import 'dart:developer';

import 'package:todo_app_example/app/const/api_const.dart';
import 'package:todo_app_example/app/core/call_of_api/api_call.dart';
import 'package:todo_app_example/app/data/response_modal.dart';

class AuthenticationRpository {
  // for login

  Future login({
    required String email,
    required String password,
  }) async {
    final data = {
      'Email': email,
      'password': password,
    };
    ApiCall.instance.restMainApi(
      restMethodType: MethodType.post,
      apiData: data,
      url: '/employee/login',
      onSuccess: (mapValues) {
        // log(mapValues['data']['0']['trx_id']);
        LoginResponseModal model = LoginResponseModal.fromJson(mapValues);
        log('STRING - Name${model.data!.first.name!}');
      },
    );
  }
}
