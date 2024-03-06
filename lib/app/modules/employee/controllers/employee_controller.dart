import 'package:get/get.dart';
import 'package:todo_app_example/app/data/employee_modal.dart';
import 'package:todo_app_example/app/modules/employee/repository/employee_repo.dart';

class EmployeeController extends GetxController {
  EmployeeRepository empRepo = EmployeeRepository();
  Rx<EmployeeModal> empData = EmployeeModal().obs;
  fetchAllEmployees() async {
    final eData = await empRepo.getAllEployees();
    if (eData != null) {
      empData.value = eData;
      // update();
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchAllEmployees();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
