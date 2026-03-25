import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/homebottom_nav.dart';
import '../../controller/Listening/listening_controller.dart';

class ListeningPage extends StatelessWidget {
  ListeningPage({super.key});

  final ListeningController controller =
  Get.isRegistered<ListeningController>()
      ? Get.find<ListeningController>()
      : Get.put(ListeningController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 16),

              /// HEADER
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back,
                        size: 24, color: Colors.black),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Listening",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'ClashDisplay',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// TOPIC LIST
              Expanded(
                child: Obx(() {
                  if (controller.topics.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: controller.topics.length,
                    itemBuilder: (context, index) {

                      return Obx(() {

                        final isSelected =
                            controller.selectedSectionIndex.value == index;

                        return GestureDetector(
                          onTap: () => controller.selectTopic(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 22,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD6E9FF),
                              borderRadius: BorderRadius.circular(18),
                              border: isSelected
                                  ? Border.all(
                                color: const Color(0xFF4D5BD6),
                                width: 2.2,
                              )
                                  : Border.all(
                                color: Colors.transparent,
                                width: 2.2,
                              ),
                            ),
                            child: Text(
                              controller.topics[index],
                              style: const TextStyle(
                                fontSize: 17,
                                fontFamily: 'ClashDisplay',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  );
                }),
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