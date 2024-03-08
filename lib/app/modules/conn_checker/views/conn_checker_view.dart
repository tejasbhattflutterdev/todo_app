import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/conn_checker_controller.dart';

class ConnCheckerView extends GetView<ConnCheckerController> {
  const ConnCheckerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConnCheckerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ConnCheckerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
