import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/homebottom_nav.dart';
import '../../controller/Reading/reading_controller.dart';
import 'NavPage/passageview.dart';

class ReadingPage extends StatelessWidget {
  ReadingPage({super.key});

  final ReadingController controller = Get.put(ReadingController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
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
                    "Reading",
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
                          Get.to(()=>PassageView());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 22),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 22,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFA6F3B8),
                            borderRadius: BorderRadius.circular(28),
                            border: isSelected
                                ? Border.all(
                              color: Color(0xFF3EC419),
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