import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/employee_controller.dart';

class EmployeeView extends GetView<EmployeeController> {
  const EmployeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeeView'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: controller.empList.length,
            itemBuilder: (context, index) {
              return Text(
                controller.empList[0].data![0].employeeId.toString(),
              );
            },
          );
        },
      ),
    );
  }
}
