import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:todo_app_example/app/modules/todos/controllers/todos_controller.dart';
import 'package:todo_app_example/widgets/w_text_form_field.dart';

class AddTodos extends StatelessWidget {
  //final NetworkController networkController = Get.put(NetworkController());

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
  AddTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            RTextFormField(
              labelText: 'Employee Id',
              obscureText: false,
              txtController: empIDController,
            ),
            const SizedBox(
              height: 25,
            ),
            RTextFormField(
              labelText: 'Manager Id',
              obscureText: false,
              txtController: managerIDConroller,
            ),
            const SizedBox(
              height: 25,
            ),
            RTextFormField(
              labelText: 'Created Date',
              obscureText: false,
              txtController: createdDateController,
            ),
            const SizedBox(
              height: 25,
            ),
            RTextFormField(
              labelText: 'Work',
              obscureText: false,
              txtController: workControler,
            ),
            const SizedBox(
              height: 25,
            ),
            RTextFormField(
              labelText: 'Deadline',
              obscureText: false,
              txtController: deadLineController,
            ),
            const SizedBox(
              height: 25,
            ),
            RTextFormField(
              labelText: 'Completion Date',
              obscureText: false,
              txtController: completionController,
            ),
            const SizedBox(
              height: 25,
            ),
            RTextFormField(
              labelText: 'Reason',
              obscureText: false,
              txtController: reasonController,
            ),
            const SizedBox(height: 75),
            ElevatedButton(
                onPressed: () {
                  // networkController.isConnectivity.value == true
                  //     ? controller.insertTodo()
                  //     : Get.showSnackbar(
                  //         const GetSnackBar(
                  //           duration: Duration(seconds: 3),
                  //           title: 'Please Turn On Internet',
                  //           message: 'Please Connect to internet',
                  //         ),
                  //       );
                  //=======================
                  //works when there is internet/wi-fi is on
                  //start from here
                  //=======================
                  // try {
                  //   controller.insertTodo(
                  //     empid: 34,
                  //     manageId: 34,
                  //     completedDate: '2024-04-06',
                  //     createdDate: '2024-02-06',
                  //     wrk: workControler.text,
                  //     reason: reasonController.text,
                  //     deadLine: 9,
                  //     isDeleted: false,
                  //   );
                  // } catch (e) {
                  //   log('Error in adding data  = ${e.toString()}');
                  // }
                  //========================
                  //ends here
                  // controller.listPersonalData[0].data![0].employeeId = 43;
                  // controller.listPersonalData[0].data![0].managerId = 43;
                  // controller.listPersonalData[0].data![0].createdDate =
                  //     '2024-01-01';
                  // controller.listPersonalData[0].data![0].work =
                  //     'TODO - WORK - First - When - No - INTERNET';
                  // controller.listPersonalData[0].data![0].deadline = 43;
                  // controller.listPersonalData[0].data![0].completionDate =
                  //     '2024-01-01';
                  // controller.listPersonalData[0].data![0].isdeleted =
                  //     'Don\'t delete ';
                  // controller.listPersonalData[0].data![0].reason = '2024-01-01';

                  // localStorage.write(
                  //     'listPersonalData', controller.listPersonalData);
                  final completionDate =
                      completionController.text.trim().toString();
                  final createdDate = DateTime.now();
                  int year = createdDate.year;
                  String month = createdDate.month
                      .toString()
                      .padLeft(2, '0'); // Ensure two digits
                  String day = createdDate.day.toString().padLeft(2, '0');
                  String work = workControler.text.trim();
                  String reason = reasonController.text.trim();
                  int deadLine = int.parse(deadLineController.text.trim());
                  controller.insertTodo(
                    empid: localStorage.read('EmployeeId'),
                    manageId: 43,
                    completedDate: completionDate,
                    createdDate: '$year-$month-$day',
                    wrk: work,
                    reason: reason,
                    deadLine: deadLine,
                    isDeleted: isDeleted,
                  );

                  //List<insert_todo_modal> insertList = [];
                },
                child: const Text('Add Data'))
          ],
        ),
      ),
    );
  }
}
