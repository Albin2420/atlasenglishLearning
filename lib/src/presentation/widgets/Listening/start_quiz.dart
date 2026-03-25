import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/Listening/listening_controller.dart';
class StartQuiz extends StatelessWidget {
  const StartQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    final ListeningController controller = Get.find<ListeningController>();

    return Obx(() {
      // Hide once quiz is already visible
      if (controller.quizVisible.value) return const SizedBox.shrink();

      return SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff2F66E2),
            elevation: 3,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: controller.showQuiz,
          child: const Text(
            "Start Quiz",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'ClashDisplay',
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}