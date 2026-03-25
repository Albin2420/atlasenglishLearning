import 'package:atlas_learning/src/presentation/widgets/HomeScreen/start_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../screens/Speaking/speaking_page.dart';

class DailySpeak extends StatelessWidget {
  final VoidCallback onTap;

  const DailySpeak({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: const Color(0xFFFFE3D3),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 20,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Daily speaking\npractice",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'ClashDisplay',
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 12),

                    StartButton(
                      onTap: () {
                        Get.to(() => SpeakingPage());
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Image.asset("assets/images/roc.png"),
            ),
          ),
        ],
      ),
    );
  }
}
