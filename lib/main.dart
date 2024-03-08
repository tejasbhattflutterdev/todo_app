import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_example/app/modules/conn_checker/controllers/conn_checker_controller.dart';
import 'package:todo_app_example/app/modules/todos/controllers/todos_controller.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ConnCheckerController());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      //home: PersnalToDoInfo(),
    ),
  );
}
