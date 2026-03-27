import 'package:flutter/material.dart';
import '../../controller/SignupPage/signup_controller.dart';

class SignupWidget extends StatelessWidget {
  final SignupController controller;

  const SignupWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12), // 👈 SAME as fields
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: controller.signup,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2F5BD3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 6,
          ),
          child: const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'ClashDisplay',
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
