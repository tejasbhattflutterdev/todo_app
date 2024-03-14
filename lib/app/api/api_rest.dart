import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:todo_app_example/app/const/api_const.dart';


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
    required Map<String, dynamic>? mapHeader,
  }) async {
    //List<EmployeeModal> empList = [];
    try {
      log(apiData.toString());
      log(url.toString());
      if (restMethodType == MethodType.get) {
        // final myGetHeader = {
        //   'accept': 'application/json',
        //   'Tra-ID': storg.read('trx_id'),
        //   'Device-ID': 'mobile',
        // };
        final response = await dio.get(url,
            options: Options(
              responseType: ResponseType.json,
              headers: mapHeader,
            ));
        // if (response.statusCode == 200) {
        //   Iterable jsonData = response.data;
        //   empList = jsonData.map((e) => EmployeeModal.fromJson(e)).toList();
        // }
        onSuccess(response.data);
        return response;
      }
      if (restMethodType == MethodType.post) {
        Response res = await dio.post(
          url,
          data: apiData,
          options: Options(
            responseType: ResponseType.json,
            headers: mapHeader,
          ),
        );
        if (res.statusCode == 200) {
          log('DATA  = ${res.data}');
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
