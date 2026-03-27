import 'package:flutter/material.dart';

class SignupController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> isPasswordHidden = ValueNotifier(true);

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void signup() {
    print("Username: ${usernameController.text}");
    print("Email: ${emailController.text}");
    print("Phone: ${phoneController.text}");
    print("Password: ${passwordController.text}");
  }
}
