import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app_example/app/modules/employee/views/employee_view.dart';
import 'package:todo_app_example/app/modules/todos/views/todos_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
                Get.to(PersonalTodoView());
              },
              child: const Text(
                'Personal Todo Details',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
