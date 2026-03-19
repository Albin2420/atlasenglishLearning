import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onBoarding/onBoardcontroller.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onboardcontroller());
    return Scaffold(backgroundColor: Colors.white);
  }
}
