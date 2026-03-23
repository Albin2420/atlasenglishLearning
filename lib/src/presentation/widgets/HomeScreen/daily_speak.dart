import 'package:flutter/material.dart';

class DailySpeak extends StatelessWidget {
  const DailySpeak({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFFFFE3D3),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            Expanded(
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
                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDEECF1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'ClashDisplay',
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Image.asset("assets/images/rocket.png", height: 80),
          ],
        ),
      ),
    );
  }
}
