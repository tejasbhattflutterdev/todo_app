import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:todo_app_example/app/const/api_const.dart';
import 'package:todo_app_example/app/data/employee_modal.dart';

mixin REST {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.60.101:61000/rupiya/v1',
      connectTimeout: const Duration(
        minutes: 1,
      ),
      receiveTimeout: const Duration(
        minutes: 1,
      ),
    ),
  );
  Future restMainApi({
    required String url,
    Map<String, dynamic>? apiData,
    required MethodType restMethodType,
    required void Function(Map<String, dynamic> mapValues) onSuccess,
  }) async {
    List<EmployeeModal> empList = [];
    try {
      log(apiData.toString());
      log(url.toString());
      if (restMethodType == MethodType.get) {
        final myGetHeader = {
          'accept': 'application/json',
          'Tra-ID': 'c2d0c1dfa33c41fa91781876f6a888e9',
          'Device-ID': 'mobile',
        };
        final response = await dio.get(url!,
            options: Options(
              responseType: ResponseType.json,
              headers: myGetHeader,
            ));
        // if (response.statusCode == 200) {
        //   Iterable jsonData = response.data;
        //   empList = jsonData.map((e) => EmployeeModal.fromJson(e)).toList();
        // }
        return response;
      }
      if (restMethodType == MethodType.post) {
        final myPostHader = {
          'Content-Type': 'application/json',
          'Device-ID': 'mobile',
          'accept': 'application/json'
        };
        Response res = await dio.post(
          url!,
          data: apiData,
          options: Options(
            responseType: ResponseType.json,
            headers: myPostHader,
          ),
        );
        if (res.statusCode == 200) {
          log('DATA  = ' + res.data.toString());
          String transactionId = res.data['data'][0]['trx_id'];
          log(transactionId);
          String mName = res.data['data'][0]['Name'];
          log(mName);
          onSuccess(res.data);
        }
      }
    } catch (_) {
      log(_.toString());
    }
  }
}
