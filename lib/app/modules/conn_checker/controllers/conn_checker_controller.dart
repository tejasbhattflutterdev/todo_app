import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnCheckerController extends GetxController {
  RxBool isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkConnectivity() {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          isConnected.value = true;
          // Get.dialog(AlertDialog(
          //   title: const Text('Internet is on'),
          //   content:
          //       Text('You are connected to the internet.${isConnected.value}'),
          //   actions: [
          //     TextButton(
          //       onPressed: () {
          //         Get.back();
          //       },
          //       child: const Text('OK'),
          //     ),
          //   ],
          // ));
        } else {
          isConnected.value = false;
          // Get.dialog(AlertDialog(
          //   title: const Text('Internet is off'),
          //   content: Text('please connect to.${isConnected.value}'),
          //   actions: [
          //     TextButton(
          //       onPressed: () {
          //         Get.back();
          //       },
          //       child: const Text('OK'),
          //     ),
          //   ],
          // ));
          //update();
        }
      },
    );
  }
}
