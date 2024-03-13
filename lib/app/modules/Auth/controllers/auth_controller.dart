import 'package:get/get.dart';
import 'package:todo_app_example/app/modules/Auth/repository/auth_repo.dart';

class AuthController extends GetxController {
  AuthenticationRpository authRepo = AuthenticationRpository();
  Future loginForToDo({String? email, String? password}) async {
    await authRepo.login(
      email: email!,
      password: password!,
    );
  }

  Future logoutFromTodaApp({required int empId}) async {
    await authRepo.logout(
      empId: empId,
    );
  }
}
