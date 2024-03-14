import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';

class DropdownController extends GetxController {
  Rx<String?> selectedManagerialValue = 'Ankit Bhatt'.obs;
  Rx<String?> selectedEployeeValue = 'Ankit Bhatt'.obs;
  RxString selectedEmpOfflineValue = 'Ankit Bhatt'.obs;
  RxString selectedManageOfflineValue = 'Ankit Bhatt'.obs;
  RxInt selectedManagerOfflineId = 0.obs;
  RxInt selectedEmployeeOfflineId = 0.obs;
  RxInt selectedManagerialId = 0.obs;
  RxInt selectedEmployeeId = 0.obs;
  final storage = GetStorage();

  void setSelectedValueForManagerial(String value, int id) {
    selectedManagerialValue.value = value;
    selectedManagerialId.value = id;
    storage.write('managerId', selectedManagerialId.value);
  }

  void setSelectedValueForEmployye(String eValue, int eId) {
    selectedEployeeValue.value = eValue;
    selectedEmployeeId.value = eId;
  }

  void setSelectedValueForOfflineEmployye(
      String eOfflineEmpValue, int eOfflineEmpId) {
    selectedEmpOfflineValue.value = eOfflineEmpValue;
    selectedEmployeeOfflineId.value = eOfflineEmpId;
    storage.write('offlineEmpId', selectedEmployeeOfflineId.value);
  }

  void setSelectedValueForOfflineManagerial(
      String eOfflineManagerValue, int eOfflineManagerId) {
    selectedManageOfflineValue.value = eOfflineManagerValue;
    selectedManagerOfflineId.value = eOfflineManagerId;
    storage.write('offlineManagerialId', selectedManagerOfflineId.value);
  }
}
