import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_app_example/app/modules/todos/controllers/todos_controller.dart';

class PersnalToDoInfo extends StatelessWidget {
  final TodosController controller = Get.put(TodosController());
  final int? empId;
  final int? managerId;
  final int? toDoId;
  final String? createdDate;
  final String? workTitle;
  final String? updatedDate;
  final int? deadLine;
  final String? completionDate;
  PersnalToDoInfo({
    super.key,
    this.empId,
    this.managerId,
    this.toDoId,
    this.createdDate,
    this.workTitle,
    this.updatedDate,
    this.deadLine,
    this.completionDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade500,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)),
      ),
      height: 320,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text('Employee Id ==== $empId'),
                Text('Manager Id ==== $managerId'),
                Text('Todo Work Id ==== $toDoId'),
                Text('Todo Created Date ==== $createdDate'),
                Text('Todo Task Name ==== $workTitle'),
                Text('Todo updated Date ==== $updatedDate'),
                Text('Todo deadLine ==== $deadLine'),
                Text('Todo Completion Date === $completionDate'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                log('Completed Button Pressed');

                controller.completionTodo(
                  myTodoId: toDoId!,
                  myEmpId: empId!,
                );
                log('Completion Todo');
                log('Completion Todo id = ${toDoId!}');
                log('Completion Todo Emp id = ${empId!}');
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                  color: Colors.purple.shade500,
                ),
                child: const Center(
                  child: Text(
                    'Completed',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
