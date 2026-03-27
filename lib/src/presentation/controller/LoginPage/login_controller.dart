import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> isPasswordHidden = ValueNotifier(true);
  final ValueNotifier<bool> rememberMe = ValueNotifier(true);

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleRemember(bool value) {
    rememberMe.value = value;
  }

  void login() {
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    print("Remember: ${rememberMe.value}");
  }
}
