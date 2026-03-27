import 'package:flutter/material.dart';
import '../../controller/SignupPage/signup_controller.dart';
import '../../widgets/SignupPage/buildtext_field.dart';
import '../../widgets/SignupPage/signup_widget.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final SignupController controller = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),

      body: Stack(
        children: [

          /// 🔵 TOP RIGHT GRADIENT
          Positioned(
            top: -40,
            right: -90,
            child: Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0x33F28C44),
                    Colors.transparent,
                  ],
                  stops: [0.2, 2],
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(height: 10),

                  /// 🔹 IMAGE
                  Image.asset(
                    "assets/images/signup.png",
                    height: 280,
                  ),

                  const SizedBox(height: 10),

                  /// 🔹 TITLE
                  const Text(
                    "Create an account",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'ClashDisplay',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// 🔹 SUBTITLE
                  const Text(
                    "Connect with your friends today!",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'ClashDisplay',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// 🔹 USERNAME
                  SignupTextField(
                    controller: controller.usernameController,
                    hint: "Enter Your Username",
                  ),

                  const SizedBox(height: 16),

                  /// 🔹 EMAIL
                  SignupTextField(
                    controller: controller.emailController,
                    hint: "Enter Your Email",
                  ),

                  const SizedBox(height: 16),

                  /// 🔹 PHONE
                  SignupTextField(
                    controller: controller.phoneController,
                    hint: "Enter Your Phone Number",
                  ),

                  const SizedBox(height: 16),

                  /// 🔹 PASSWORD
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12), // 👈 SAME as other fields
                    child: ValueListenableBuilder<bool>(
                      valueListenable: controller.isPasswordHidden,
                      builder: (context, value, _) {
                        return TextField(
                          controller: controller.passwordController,
                          obscureText: value,
                          style: const TextStyle(
                            fontSize: 17,
                            fontFamily: 'ClashDisplay',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter Your Password",
                            hintStyle: const TextStyle(
                              fontSize: 17,
                              fontFamily: 'ClashDisplay',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, // 👈 match textfield
                              vertical: 14,   // 👈 slightly compact height
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePassword,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// 🔥 SIGN UP BUTTON
                  SignupWidget(controller: controller),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
