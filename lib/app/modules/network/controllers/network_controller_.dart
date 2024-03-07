import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class NetworkController extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//   RxBool isConnectivity = false.obs;
//   @override
//   void onInit() {
//     super.onInit();
//     _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
//   }

  // Future<bool> updateConnectionStatus(
  //     ConnectivityResult connectivityResult) async {
  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi) {
  //     Get.rawSnackbar(
  //         messageText: const Text('PLEASE CONNECT TO THE INTERNET',
  //             style: TextStyle(color: Colors.green, fontSize: 14)),
  //         isDismissible: true,
  //         duration: const Duration(days: 1),
  //         backgroundColor: Colors.red[400]!,
  //         icon: const Icon(
  //           Icons.wifi_off,
  //           color: Colors.white,
  //           size: 35,
  //         ),
  //         margin: EdgeInsets.zero,
  //         snackStyle: SnackStyle.GROUNDED);
  //     return true;
  //   } else {
  //     if (Get.isSnackbarOpen) {
  //       Get.closeCurrentSnackbar();
  //     }
  //     isConnectivity.value = true;
  //     return false;
  //   }
  // }


//}
