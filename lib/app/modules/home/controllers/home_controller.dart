import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_example/app/core/call_of_api/custom_storage.dart';
import 'package:todo_app_example/app/data/insert_to_do_modal.dart';
import 'package:todo_app_example/app/modules/network/controllers/network_controller_.dart';
import 'package:todo_app_example/app/modules/todos/controllers/todos_controller.dart';

class HomeController extends GetxController {
  //final NetworkController networkController = Get.find<NetworkController>();
  //TodosController myTodos = Get.put(TodosController());
  //TODO: Implement HomeController
  RxBool myIsConnected = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    //networkController.isConnectivity.value;
    //checkConnectivity();
    super.onInit();
  }

  @override
  void onReady() {
    checkConnectivity();
    // myIsConnected.value == true
    //     ? Get.dialog(AlertDialog(
    //         title: Text('Internet is back and your data can be saved'),
    //         content: Text('You are connected to the internet.'),
    //       ))
    //     : Get.dialog(AlertDialog(
    //         title: Text('data is stored in shared prefs'),
    //         content: Text('You are not connected to the internet.'),
    //       ));
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
          myIsConnected.value = true;
          // Get.dialog(AlertDialog(
          //   title: Text('Internet is back'),
          //   content: Text('You are connected to the internet.'),
          //   actions: [
          //     TextButton(
          //       onPressed: () {
          //         Get.back();
          //       },
          //       child: Text('OK'),
          //     ),
          //   ],
          // ));
          getAllTodoDetails();
        } else {
          myIsConnected.value = false;
          Get.dialog(AlertDialog(
            title: Text('Internet is off'),
            content: Text('You are not connected to the internet.'),
          ));
        }
      },
    );
  }

  getAllTodoDetails() async {
    List<insert_todo_modal> insertedList =
        await TodoSharedPrefStorage.getTodos();
    log('==========================');
    log(insertedList[0].employeeId.toString());
    log(insertedList[0].managerId.toString());
    log(insertedList.length.toString());
    log('==========================');
  }
}
