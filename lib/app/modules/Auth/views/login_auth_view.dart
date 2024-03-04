import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app_example/widgets/w_text_form_field.dart';
import 'package:todo_app_example/widgets/widget_const.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(
                left: Wconst.padL20,
                right: Wconst.padR20,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: Wconst.size20,
                  ),
                  RTextFormField(
                    txtController: emailController,
                    labelText: 'E-Mail',
                  ),
                  const SizedBox(
                    height: Wconst.size20,
                  ),
                  RTextFormField(
                    txtController: passwordController,
                    labelText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: Wconst.size20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.loginForToDo(
                        email: 'kinjal.r@rupiya.app',
                        password: 'kinjal.rupiya@123',
                      );
                      log('Success');
                    },
                    child: const Text(
                      'Login',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
