import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/employee_controller.dart';

class EmployeeView extends StatelessWidget {
  final controller = Get.put(EmployeeController());
  EmployeeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeeView'),
        centerTitle: true,
      ),
      body: Obx(() {
        final empData = controller.empData.value.data;
        if (empData != null) {
          return ListView.builder(
            itemCount: empData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(empData[index].employeeId.toString()),
                  Text(empData[index].name.toString()),
                ],
              );
            },
          );
        } else {
          // Handle the case where empData is null (optional)
          return Center(child: Text('No data available'));
        }
      }),
    );
  }
}
