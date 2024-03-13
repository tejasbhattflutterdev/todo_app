import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DropdownController extends GetxController {
  RxString selectedManagerialValue = 'Ankit Bhatt'.obs;
  RxString selectedEployeeValue = 'Ankit Bhatt'.obs;
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
}
