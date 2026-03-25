import 'package:flutter/material.dart';

class QuizQuestion extends StatelessWidget {
  final String question;
  final List<String> options;
  final int selectedIndex;   // -1 = none selected
  final int correctIndex;    // -1 = not revealed yet
  final bool submitted;
  final ValueChanged<int> onSelect;

  const QuizQuestion({
    super.key,
    required this.question,
    required this.options,
    required this.onSelect,
    this.selectedIndex = -1,
    this.correctIndex  = -1,
    this.submitted     = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// QUESTION TEXT
        Text(
          question,
          style: const TextStyle(
            fontFamily: "ClashDisplay",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff1C1C1E),
          ),
        ),

        const SizedBox(height: 12),

        /// OPTIONS
        ...List.generate(options.length, (i) {

          Color bgColor     = Colors.white;
          Color borderColor = Colors.grey.shade300;
          Color textColor   = const Color(0xff1C1C1E);

          if (submitted) {
            if (i == correctIndex) {
              bgColor     = const Color(0xffD1FAE5);
              borderColor = const Color(0xff10B981);
              textColor   = const Color(0xff065F46);
            } else if (i == selectedIndex && i != correctIndex) {
              bgColor     = const Color(0xffFEE2E2);
              borderColor = const Color(0xffEF4444);
              textColor   = const Color(0xff991B1B);
            }
          } else if (i == selectedIndex) {
            bgColor     = const Color(0xffEBF2FF);
            borderColor = const Color(0xff2F66E2);
            textColor   = const Color(0xff2F66E2);
          }

          return GestureDetector(
            onTap: () => onSelect(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor, width: 1.5),
              ),
              child: Row(
                children: [

                  /// RADIO INDICATOR
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == selectedIndex || (submitted && i == correctIndex)
                          ? borderColor
                          : Colors.transparent,
                      border: Border.all(color: borderColor, width: 2),
                    ),
                    child: submitted && i == correctIndex
                        ? const Icon(Icons.check, size: 11, color: Colors.white)
                        : submitted && i == selectedIndex && i != correctIndex
                        ? const Icon(Icons.close, size: 11, color: Colors.white)
                        : null,
                  ),

                  const SizedBox(width: 12),

                  /// OPTION TEXT
                  Expanded(
                    child: Text(
                      options[i],
                      style: TextStyle(
                        fontFamily: "ClashDisplay",
                        fontSize: 14,
                        fontWeight: i == selectedIndex
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}