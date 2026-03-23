import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {

  final VoidCallback onPressed;

  const SubmitButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC74A45),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation:  2,
        ),

        child: const Text(
          "Submit",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "ClashDisplay",
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
