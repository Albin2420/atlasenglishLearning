import 'package:flutter/material.dart';
import '../../controller/LoginPage/login_controller.dart';
import '../../widgets/LoginPage/login_widget.dart';
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),

      body: Stack(
        children: [

          /// 🔵 GRADIENT
          Positioned(
            top: -40,
            left: -90,
            child: Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0x332F5BD3),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 60),

                  /// IMAGE
                  Center(
                    child: Image.asset(
                      "assets/images/fall.png",
                      height: 176,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// TITLE
                  const Center(
                    child: Text(
                      "Hi, Welcome Back! 👋",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'ClashDisplay',
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// EMAIL
                  const Text("Email"),
                  const SizedBox(height: 8),

                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: "example@gmail.com",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// PASSWORD
                  const Text("Password"),
                  const SizedBox(height: 8),

                  ValueListenableBuilder<bool>(
                    valueListenable: controller.isPasswordHidden,
                    builder: (context, value, _) {
                      return TextField(
                        controller: controller.passwordController,
                        obscureText: value,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          filled: true,
                          fillColor: Colors.white,
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
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  /// REMEMBER + FORGOT
                  ValueListenableBuilder<bool>(
                    valueListenable: controller.rememberMe,
                    builder: (context, value, _) {
                      return Row(
                        children: [
                          Checkbox(
                            value: value,
                            onChanged: (val) =>
                                controller.toggleRemember(val!),
                          ),
                          const Text("Remember Me"),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Forgot Password?"),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  /// 🔥 LOGIN BUTTON (FROM WIDGET)
                  LoginWidget(controller: controller),

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
