import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_example/app/modules/network/controllers/network_controller_.dart';
import 'package:todo_app_example/app/modules/todos/controllers/todos_controller.dart';
import 'package:todo_app_example/app/modules/todos/views/todos_add.dart';
import 'package:todo_app_example/widgets/personal_todo_info.dart';

class PersonalTodoView extends StatelessWidget {
  final TodosController controller = Get.put(TodosController());
  //final NetworkController networkController = Get.put(NetworkController());
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
                return GestureDetector(
                  onTap: () {
                    controller.updateData(
                      toDoId: toDoData[index].id!,
                      empId: toDoData[index].employeeId!,
                      managerId: toDoData[index].managerId!,
                    );
                  },
                  onLongPress: () {
                    controller.deleteParticularTodo(
                        todoWorkId: toDoData[index].id!);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 18,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Column(
                      children: [
                        PersnalToDoInfo(
                          createdDate: toDoData[index].createdDate,
                          updatedDate: toDoData[index].updatedDate,
                          empId: toDoData[index].employeeId.toString(),
                          toDoId: toDoData[index].id.toString(),
                          workTitle: toDoData[index].work,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            // Handle the case where empData is null (optional)
            return const Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(AddTodos());
        },
      ),
    );
  }
}
