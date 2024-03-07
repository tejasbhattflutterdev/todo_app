import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_example/app/modules/network/controllers/network_controller_.dart';
import 'package:todo_app_example/app/modules/todos/controllers/todos_controller.dart';

class HomeController extends GetxController {
  //final NetworkController networkController = Get.find<NetworkController>();
  //TodosController myTodos = Get.put(TodosController());
  //TODO: Implement HomeController
  RxBool isConnected = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    //networkController.isConnectivity.value;
    super.onInit();
  }

  @override
  void onReady() {
    checkConnectivity();
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
          Get.dialog(AlertDialog(
            title: Text('Internet is back'),
            content: Text('You are connected to the internet.'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('OK'),
              ),
            ],
          ));
        } else {
          isConnected.value = false;
        }
      },
    );
  }
}
