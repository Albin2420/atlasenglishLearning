import 'package:flutter/material.dart';
import '../../controller/LoginPage/login_controller.dart';

class LoginWidget extends StatelessWidget {
  final LoginController controller;

  const LoginWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: controller.login,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2F5BD3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
