import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_example/app/modules/todos/controllers/todos_controller.dart';

class PersonalTodoView extends StatelessWidget {
  final TodosController controller = Get.put(TodosController());
  PersonalTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal ToDos'),
      ),
      body: Obx(
        () {
          final toDoData = controller.toDoData.value.data;
          if (toDoData != null) {
            return ListView.builder(
              itemCount: toDoData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(toDoData[index].employeeId.toString()),
                    Text(toDoData[index].managerId.toString()),
                    Text(toDoData[index].deadline.toString()),
                    Text(toDoData[index].work.toString()),
                  ],
                );
              },
            );
          } else {
            // Handle the case where empData is null (optional)
            return Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.insertTodo();
        },
      ),
    );
  }
}
