import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onBoarding/onBoardcontroller.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onboardcontroller());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/atlas.png',
              width: 260,
              height: 260,
              fit: BoxFit.contain,
            ),

            const Text(
              "Atlas",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                fontFamily: 'ClashDisplay',
                color: Color(0xff253755),
                letterSpacing: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
