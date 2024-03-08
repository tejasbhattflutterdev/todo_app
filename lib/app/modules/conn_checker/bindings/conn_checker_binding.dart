import 'package:get/get.dart';

import '../controllers/conn_checker_controller.dart';

class ConnCheckerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnCheckerController>(
      () => ConnCheckerController(),
    );
  }
}
