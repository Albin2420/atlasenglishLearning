import 'package:flutter/material.dart';

class DailySpeak extends StatelessWidget {

  final VoidCallback onTap;

  const DailySpeak({
    super.key,
    required this.onTap,
  });

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

                  /// 🔹 BUTTON
                  InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: onTap, // ✅ use passed function
                    child: Container(
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
