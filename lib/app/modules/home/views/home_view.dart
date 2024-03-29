import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_example/app/core/call_of_api/custom_storage.dart';
import 'package:todo_app_example/app/data/insert_to_do_modal.dart';
import 'package:todo_app_example/app/modules/Auth/controllers/auth_controller.dart';
import 'package:todo_app_example/app/modules/Auth/views/login_auth_view.dart';
import 'package:todo_app_example/app/modules/conn_checker/controllers/conn_checker_controller.dart';
import 'package:todo_app_example/app/modules/employee/views/employee_view.dart';

import 'package:todo_app_example/app/modules/todos/views/todos_view.dart';


import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final ConnCheckerController connController = Get.put(ConnCheckerController());
  final AuthController authController = Get.find<AuthController>();
  //final TodosController todosController = Get.put(TodosController());
  final List<insert_todo_modal> retrievedList = [];
  final storage = GetStorage();
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(EmployeeView());
              },
              child: const Text(
                'Employee Details',
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            ElevatedButton(
              onPressed: () {
                // connController.checkConnectivity();
                Get.to(() => PersonalTodoView());
              },
              child: const Text(
                'Personal Todo Details',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                authController.logoutFromTodaApp(
                  empId: storage.read(
                    'EmployeeId',
                  ),
                );
                Get.snackbar(
                  'Logout Success',
                  'Logout:',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.grey[800],
                  colorText: Colors.white,
                );

                Get.offAll(() => AuthView());
              },
              child: const Text(
                'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTodoDetails() async {
    List<insert_todo_modal> insertedList =
        await TodoSharedPrefStorage.getTodos();
    log(insertedList.first.completionDate.toString());
    log(insertedList[0].employeeId.toString());
    log(insertedList[0].managerId.toString());
    log(insertedList.length.toString());
  }

  logOut() {}
}
