import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_example/app/data/employee_modal.dart';
import 'package:todo_app_example/app/modules/conn_checker/controllers/conn_checker_controller.dart';
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
  final connController = Get.find<ConnCheckerController>();
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
                const Text('Please Select Employee Person Name'),
                Obx(() {
                  final empData = empController.empData.value.data;
                  final selectedValue =
                      dropDownController.selectedEployeeValue.value;
                  final offLineData = empController.offLineData.value!.data;
                  final selectedEmployeeOfflineValue =
                      dropDownController.selectedEmpOfflineValue.value;

                  //final selectedId = dropDownController.selectedId.value;

                  return DropdownButton<String>(
                    value: connController.isConnected.value == true
                        ? selectedValue
                        : selectedEmployeeOfflineValue,
                    onChanged: (String? newValue) {
                      if (connController.isConnected.value == true) {
                        final selectedItem = empData!
                            .firstWhere((element) => element.name == newValue);
                        dropDownController.setSelectedValueForEmployye(
                          selectedItem.name!,
                          selectedItem.employeeId!,
                        );
                        log('Employee Id = ${selectedItem.employeeId}');
                        log('Employee Name = ${selectedItem.name}');
                      } else {
                        final selectedfflineEmpItem = offLineData
                            ?.firstWhere((element) => element.name == newValue);
                        dropDownController.setSelectedValueForOfflineEmployye(
                          selectedfflineEmpItem!.name!,
                          selectedfflineEmpItem.employeeId!,
                        );
                        log('Offline Employee Id = ${selectedfflineEmpItem.employeeId}');
                        log('Offline Employee Name = ${selectedfflineEmpItem.name}');
                      }
                    },
                    items: empData?.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name!),
                          );
                        }).toList() ??
                        offLineData!.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name!),
                          );
                        }).toList(),
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                const Text('Please Select Managerial Person Name'),
                Obx(() {
                  final offLineData = empController.offLineData.value!.data;
                  final empData = empController.empData.value.data;
                  final selectedValue =
                      dropDownController.selectedManagerialValue.value;
                  final selectedManagerOfflineValue =
                      dropDownController.selectedManageOfflineValue.value;
                  //final selectedId = dropDownController.selectedId.value;

                  return DropdownButton<String>(
                      value: connController.isConnected.value == true
                          ? selectedValue
                          : selectedManagerOfflineValue,
                      onChanged: (String? newValue) {
                        // final selectedItem = empData!
                        //     .firstWhere((element) => element.name == newValue);
                        // dropDownController.setSelectedValueForManagerial(
                        //     selectedItem.name!, selectedItem.employeeId!);
                        // log('Managerial Id = ${selectedItem.employeeId}');
                        // log('Managerial Name = ${selectedItem.name}');
                        if (connController.isConnected.value == true) {
                          final selectedItem = empData!.firstWhere(
                              (element) => element.name == newValue);
                          dropDownController.setSelectedValueForManagerial(
                            selectedItem.name!,
                            selectedItem.employeeId!,
                          );
                          log('Manager Id = ${selectedItem.employeeId}');
                          log('Manager Name = ${selectedItem.name}');
                        } else {
                          final selectedOfflineManagerItem =
                              offLineData?.firstWhere(
                                  (element) => element.name == newValue);
                          dropDownController
                              .setSelectedValueForOfflineManagerial(
                            selectedOfflineManagerItem!.name!,
                            selectedOfflineManagerItem.employeeId!,
                          );
                          log('Offline Manager Id = ${selectedOfflineManagerItem.employeeId}');
                          log('Offline Manager Name = ${selectedOfflineManagerItem.name}');
                        }
                      },
                      items: empData?.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name!),
                            );
                          }).toList() ??
                          offLineData!.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name!),
                            );
                          }).toList());
                }),
                const SizedBox(
                  height: 45,
                ),

                // const SizedBox(
                //   height: 13,
                // ),
                // RTextFormField(
                //   isEnabled: false,
                //   labelText: 'Manager Id',
                //   obscureText: false,
                //   txtController: managerIDConroller,
                // ),
                // const SizedBox(
                //   height: 13,
                // ),
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
                // const SizedBox(
                //   height: 13,
                // ),
                // RTextFormField(
                //   labelText: 'Completion Date',
                //   obscureText: false,
                //   txtController: completionController,
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 18.0),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       'Please Select Completion Date',
                //     ),
                //   ),
                // ),

                //CustomBackgroundExample(),

                // const SizedBox(
                //   height: 13,
                // ),
                // RTextFormField(
                //   labelText: 'Reason',
                //   obscureText: false,
                //   txtController: reasonController,
                // ),
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
                        empid: connController.isConnected.value == true
                            ? dropDownController.selectedEmployeeId.value
                            : dropDownController.selectedManagerOfflineId.value,
                        manageId: connController.isConnected.value == true
                            ? dropDownController.selectedManagerialId.value
                            : dropDownController.selectedManagerialId.value,
                        completedDate: 'no completed',
                        createdDate: '2024-09-09',
                        wrk: work,
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
