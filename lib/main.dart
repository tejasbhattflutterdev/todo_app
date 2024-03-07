import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_example/app/modules/network/controllers/inject_dependency_class_x.dart';
import 'package:todo_app_example/widgets/personal_todo_info.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      //home: PersnalToDoInfo(),
    ),
  );
  DependencyInjection.init();
}
