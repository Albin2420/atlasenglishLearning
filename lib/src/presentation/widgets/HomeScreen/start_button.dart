import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final VoidCallback onTap;

  const StartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFEBDEF1),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Text(
          "Start",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w500,
            color: Color(0xff2563EB),
          ),
        ),
      ),
    );
  }
}
