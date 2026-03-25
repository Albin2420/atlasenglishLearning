import 'package:atlas_learning/src/presentation/widgets/Listening/submit_button.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final int correct;
  final int total;
  final bool hasNext;
  final VoidCallback onNext;

  const ScoreCard({
    required this.correct,
    required this.total,
    required this.hasNext,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xffEBF2FF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              Text(
                "$correct / $total correct",
                style: const TextStyle(
                  fontFamily: "ClashDisplay",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2F66E2),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                correct == total
                    ? "Perfect! 🎉"
                    : correct >= (total / 2).ceil()
                    ? "Good job! Keep going."
                    : "Keep practising!",
                style: const TextStyle(
                  fontFamily: "ClashDisplay",
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        if (hasNext) ...[
          const SizedBox(height: 14),
          ListeningSubmitButton(
            label: "Next Lesson →",
            onPressed: onNext,
          ),
        ],
      ],
    );
  }
}