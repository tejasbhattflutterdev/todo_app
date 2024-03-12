import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_example/app/data/employee_modal.dart';
import 'package:todo_app_example/app/modules/employee/controllers/employee_controller.dart';
import 'package:todo_app_example/app/modules/my_controllers/controllers/datecontroller_controller.dart';
import 'package:todo_app_example/app/modules/my_controllers/controllers/dropdowncontroller_controller.dart';

import 'package:todo_app_example/app/modules/todos/controllers/todos_controller.dart';
import 'package:todo_app_example/widgets/date_timeline.dart';
import 'package:todo_app_example/widgets/w_text_form_field.dart';

class AddTodos extends StatelessWidget {
  //final NetworkController networkController = Get.put(NetworkController());
  final DateController dateController = Get.put(DateController());
  final TodosController controller = Get.put(TodosController());
  final empIDController = TextEditingController();
  final managerIDConroller = TextEditingController();
  final createdDateController = TextEditingController();
  final workControler = TextEditingController();
  final deadLineController = TextEditingController();
  final completionController = TextEditingController();
  final reasonController = TextEditingController();
  final String isDeleted = 'false';
  final localStorage = GetStorage();
  final toDoGlobalKey = GlobalKey<FormState>();
  final DropdownController dropDownController = Get.put(DropdownController());
  final empController = Get.put(EmployeeController());
  AddTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: toDoGlobalKey,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 13,
                ),
                // RTextFormField(
                //   labelText: 'Employee Id',
                //   obscureText: false,
                //   txtController: empIDController,
                //   isEnabled: false,
                // ),
                const Text('Please Select Managerial Person Name'),
                Obx(() {
                  final empData = empController.empData.value.data;
                  final selectedValue =
                      dropDownController.selectedManagerialValue.value;
                  //final selectedId = dropDownController.selectedId.value;

                  return DropdownButton<String>(
                    value: selectedValue ?? empData![0].name,
                    onChanged: (String? newValue) {
                      final selectedItem = empData
                          .firstWhere((element) => element.name == newValue);
                      dropDownController.setSelectedValueForManagerial(
                          selectedItem.name!, selectedItem.employeeId!);
                      log('Managerial Id = ${selectedItem.employeeId}');
                      log('Managerial Name = ${selectedItem.name}');
                    },
                    items: empData!.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Text(value.name!),
                      );
                    }).toList(),
                  );
                }),
                const SizedBox(
                  height: 45,
                ),
                const Text('Please Select Employee Name'),
                Obx(() {
                  final empData = empController.empData.value.data;
                  final selectedValue =
                      dropDownController.selectedEployeeValue.value;
                  //final selectedId = dropDownController.selectedId.value;

                  return DropdownButton<String>(
                    value: selectedValue ?? empData![0].name,
                    onChanged: (String? newValue) {
                      final selectedItem = empData
                          .firstWhere((element) => element.name == newValue);
                      dropDownController.setSelectedValueForEmployye(
                          selectedItem.name!, selectedItem.employeeId!);
                      log('Employee Id = ${selectedItem.employeeId}');
                      log('Employee Name = ${selectedItem.name}');
                    },
                    items: empData!.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Text(value.name!),
                      );
                    }).toList(),
                  );
                }),
                const SizedBox(
                  height: 13,
                ),
                RTextFormField(
                  isEnabled: false,
                  labelText: 'Manager Id',
                  obscureText: false,
                  txtController: managerIDConroller,
                ),
                const SizedBox(
                  height: 13,
                ),
                RTextFormField(
                  labelText: 'Created Date',
                  obscureText: false,
                  txtController: createdDateController,
                ),
                const SizedBox(
                  height: 13,
                ),
                RTextFormField(
                  labelText: 'Work',
                  obscureText: false,
                  txtController: workControler,
                ),
                const SizedBox(
                  height: 13,
                ),
                RTextFormField(
                  labelText: 'Deadline',
                  obscureText: false,
                  txtController: deadLineController,
                ),
                const SizedBox(
                  height: 13,
                ),
                // RTextFormField(
                //   labelText: 'Completion Date',
                //   obscureText: false,
                //   txtController: completionController,
                // ),
                const Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please Select Completion Date',
                    ),
                  ),
                ),

                CustomBackgroundExample(),

                const SizedBox(
                  height: 13,
                ),
                RTextFormField(
                  labelText: 'Reason',
                  obscureText: false,
                  txtController: reasonController,
                ),
                const SizedBox(height: 75),
                ElevatedButton(
                    onPressed: () {
                      //if (toDoGlobalKey.currentState!.validate()) {
                      final createdDate = DateTime.now();
                      int year = createdDate.year;
                      String month = createdDate.month
                          .toString()
                          .padLeft(2, '0'); // Ensure two digits
                      String day = createdDate.day.toString().padLeft(2, '0');
                      String work = workControler.text.trim();
                      String reason = reasonController.text.trim();
                      int deadLine = int.parse(deadLineController.text.trim());
                      String completionDate =
                          dateController.formattedDate.value.toString();
                      controller.insertTodo(
                        empid: localStorage.read('EmployeeId'),
                        manageId: dropDownController.selectedManagerialId.value,
                        completedDate: completionDate,
                        createdDate: '$year-$month-$day',
                        wrk: work,
                        reason: reason,
                        deadLine: deadLine,
                        isDeleted: isDeleted,
                      );
                    },
                    //List<insert_todo_modal> insertList = [];
                    // },
                    child: const Text('Add Data'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
