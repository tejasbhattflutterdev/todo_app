import 'package:todo_app_example/app/const/api_const.dart';
import 'package:todo_app_example/app/core/call_of_api/api_call.dart';
import 'package:todo_app_example/app/data/employee_modal.dart';

class EmployeeRepository {
  getAllEployees() async {
    final res = await ApiCall.instance.restMainApi(
      onSuccess: (s) {},
      restMethodType: MethodType.get,
      apiData: {},
      url: '/employee_id/name/get_all',
    );
    if (res != null) {
      EmployeeModal employeeModal = EmployeeModal.fromJson(res.data);
    }
  }
}
