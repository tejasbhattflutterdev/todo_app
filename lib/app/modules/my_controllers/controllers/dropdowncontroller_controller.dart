import 'package:get/get.dart';

class DropdownController extends GetxController {
  RxString selectedManagerialValue = 'Ankit Bhatt'.obs;
  RxString selectedEployeeValue = 'Ankit Bhatt'.obs;
  RxInt selectedManagerialId = 0.obs;
  RxInt selectedEmployeeId = 0.obs;

  void setSelectedValueForManagerial(String value, int id) {
    selectedManagerialValue.value = value;
    selectedManagerialId.value = id;
  }

  void setSelectedValueForEmployye(String eValue, int eId) {
    selectedEployeeValue.value = eValue;
    selectedEmployeeId.value = eId;
  }
}
