import 'package:atlas_learning/src/presentation/screens/HomeScreen/home_page.dart';
import 'package:atlas_learning/src/presentation/screens/LoginPage/login_page.dart';
import 'package:atlas_learning/src/presentation/screens/SignupPage/signup_page.dart';
import 'package:atlas_learning/src/presentation/screens/onBoarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AtlasEnglishLearningApp extends StatelessWidget {
  const AtlasEnglishLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      // home: Onboarding(),
      // home: HomeScreen(),
      // home: SignupPage(),
      home: LoginPage(),
    );
  }
}
