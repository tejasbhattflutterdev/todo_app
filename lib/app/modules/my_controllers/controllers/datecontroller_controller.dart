import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateController extends GetxController {
  late Rx<DateTime> selectedDate;
  late RxString formattedDate;

  @override
  void onInit() {
    super.onInit();
    selectedDate = DateTime.now().obs;
    formattedDate = ''.obs; // Initialize as an empty string
    updateFormattedDate(selectedDate.value); // Update formattedDate initially
  }

  @override
  void onReady() {
    super.onReady();
    showDateSnackbar(selectedDate.value);
  }

  void handleDateChange(DateTime selectedDate) {
    this.selectedDate.value = selectedDate;
    formattedDate.value = selectedDate.toString();
  }

  void updateFormattedDate(DateTime date) {
    formattedDate.value = date.toString();
  }

  void showDateSnackbar(DateTime selectedDate) {
    Get.snackbar(
      'Selected Date',
      'Selected date: ${selectedDate.toString()}',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.grey[800],
      colorText: Colors.white,
    );
  }
}
