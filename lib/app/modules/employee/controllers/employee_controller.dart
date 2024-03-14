

import 'package:get/get.dart';
import 'package:todo_app_example/app/core/call_of_api/custom_storage.dart';
import 'package:todo_app_example/app/data/employee_modal.dart';
import 'package:todo_app_example/app/modules/employee/repository/employee_repo.dart';

class EmployeeController extends GetxController {
  EmployeeRepository empRepo = EmployeeRepository();
  Rx<EmployeeModal> empData = EmployeeModal().obs;
  Rx<EmployeeModal> empDataFromLocalStorage = EmployeeModal().obs;
  Rx<EmployeeModal?> offLineData = EmployeeModal().obs;
  RxBool isLoading = true.obs;
  // TodoSharedPrefStorage todoSharedPrefStorage = TodoSharedPrefStorage();
  fetchAllEmployees() async {
    final eData = await empRepo.getAllEployees();
    isLoading.value = true;

    if (eData != null) {
      empData.value = eData;
      // update();

      TodoSharedPrefStorage.saveEmployeeData(eData);
      loadEmployeeData();
      isLoading.value = false;
    }
  }

  void loadEmployeeData() async {
    offLineData.value = await TodoSharedPrefStorage.getEmployeeData();
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
