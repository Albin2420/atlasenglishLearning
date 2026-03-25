import 'package:flutter/material.dart';

class ListeningSubmitButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const ListeningSubmitButton({
    super.key,
    this.onPressed,
    this.label = "Submit",
  });

  @override
  Widget build(BuildContext context) {
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
        onPressed: onPressed ?? () {},
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}