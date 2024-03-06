import 'package:get_storage/get_storage.dart';
import 'package:todo_app_example/app/const/api_const.dart';
import 'package:todo_app_example/app/core/call_of_api/api_call.dart';
import 'package:todo_app_example/app/data/employee_modal.dart';

class EmployeeRepository {
  EmployeeModal employeeModal = EmployeeModal();
  final storg = GetStorage();
  getAllEployees() async {
    final myGetHeader = {
      'accept': 'application/json',
      'Tra-ID': storg.read('trx_id'),
      'Device-ID': 'mobile',
    };
    final res = await ApiCall.instance.restMainApi(
        onSuccess: (s) {},
        restMethodType: MethodType.get,
        apiData: {},
        url: '/employee_id/name/get_all',
        mapHeader: myGetHeader);
    if (res != null) {
      employeeModal = EmployeeModal.fromJson(res.data);
    }
    return employeeModal;
  }
}
