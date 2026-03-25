import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/homebottom_nav.dart';
import '../../controller/Speaking/speaking_controller.dart';

class SpeakingPage extends StatelessWidget {
  SpeakingPage({super.key});

  final SpeakingController controller = Get.put(SpeakingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              /// HEADER
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, size: 26),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Speaking",
                    style: TextStyle(
                      fontSize: 34,
                      fontFamily: 'ClashDisplay',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// LIST
              Expanded(
                child: ListView.builder(
                  itemCount: controller.topics.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final isSelected =
                          controller.selectedIndex.value == index;

                      return GestureDetector(
                        onTap: () {
                          controller.selectTopic(index);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 22),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF2BC),
                            borderRadius: BorderRadius.circular(28),
                            border: isSelected
                                ? Border.all(
                                    color: Color(0xFFD6A64D),
                                    width: 1.8,
                                  )
                                : null,
                          ),
                          child: Text(
                            controller.topics[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'ClashDisplay',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeHeaderWidget(
        onTap: () {
          Get.back();
        },
      ),
    );
  }
}
