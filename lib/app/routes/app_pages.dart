import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../modules/Auth/bindings/auth_binding.dart';
import '../modules/Auth/views/login_auth_view.dart';
import '../modules/conn_checker/bindings/conn_checker_binding.dart';
import '../modules/conn_checker/views/conn_checker_view.dart';
import '../modules/employee/bindings/employee_binding.dart';
import '../modules/employee/views/employee_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/todos/bindings/todos_binding.dart';
import '../modules/todos/views/todos_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  final trxID = GetStorage().read('trx_id');

  static String getInitialRoute() {
    final trxID = GetStorage().read('trx_id');
    return (trxID != null) ? Routes.HOME : Routes.AUTH;
  }

  static String INITIAL = getInitialRoute();

  //static String INITIAL = _Paths.TODOS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE,
      page: () => EmployeeView(),
      binding: EmployeeBinding(),
    ),
    GetPage(
      name: _Paths.TODOS,
      page: () => PersonalTodoView(),
      binding: TodosBinding(),
    ),
    GetPage(
      name: _Paths.CONN_CHECKER,
      page: () => const ConnCheckerView(),
      binding: ConnCheckerBinding(),
    ),
  ];
}
