import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/Listening/listening_controller.dart';
import '../../../widgets/Listening/quiz_question.dart';
import '../../../widgets/Listening/score_card.dart';
import '../../../widgets/Listening/start_quiz.dart';
import '../../../widgets/Listening/submit_button.dart';

class ListeningPlayerPage extends StatelessWidget {
  ListeningPlayerPage({super.key});

  final ListeningController controller =
  Get.isRegistered<ListeningController>()
      ? Get.find<ListeningController>()
      : Get.put(ListeningController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            controller.player.stop();
            Get.back();
          },
        ),
        title: const Text(
          "Listening",
          style: TextStyle(
            fontFamily: "ClashDisplay",
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        final lesson = controller.currentLesson;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ── PLAYER CARD ───────────────────────────────────────────────
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(
                  //   color: const Color(0xff2F66E2),
                  //   width: 2,
                  // ),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [

                    // Cover image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        lesson.imageAsset,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Title
                    Text(
                      lesson.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "ClashDisplay",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 2),

                    // Subtitle
                    Text(
                      lesson.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "ClashDisplay",
                        fontSize: 12,
                        color: Color(0xff6B7280),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Slider + time
                    Obx(() {
                      final progress = controller.position.value;
                      final total = controller.duration.value == 0
                          ? 1.0
                          : controller.duration.value;

                      return Column(
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 3,
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 7),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 14),
                            ),
                            child: Slider(
                              value: progress.clamp(0.0, total),
                              min: 0,
                              max: total,
                              onChanged: controller.seek,
                              activeColor: const Color(0xff2F66E2),
                              inactiveColor: Colors.grey.shade300,
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _fmt(progress),
                                  style: const TextStyle(
                                    fontFamily: "ClashDisplay",
                                    fontSize: 11,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  _fmt(controller.duration.value),
                                  style: const TextStyle(
                                    fontFamily: "ClashDisplay",
                                    fontSize: 11,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),

                    const SizedBox(height: 10),

                    // Controls row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "1.0x",
                          style: TextStyle(
                            fontFamily: "ClashDisplay",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.skip_previous,
                              size: 26, color: Colors.black),
                          onPressed: controller.backward,
                        ),
                        Obx(() => GestureDetector(
                          onTap: controller.playPause,
                          child: Container(
                            height: 56,
                            width: 56,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff2F66E2),
                            ),
                            child: Icon(
                              controller.isPlaying.value
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )),
                        IconButton(
                          icon: const Icon(Icons.skip_next,
                              size: 26, color: Colors.black),
                          onPressed: controller.forward,
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.spatial_audio_off_outlined,
                          size: 24,
                          color: Colors.black54,
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── START QUIZ BUTTON ─────────────────────────────────────────
              const StartQuiz(),

              // ── QUIZ SECTION ──────────────────────────────────────────────
              Obx(() {
                if (!controller.quizVisible.value) {
                  return const SizedBox.shrink();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 8),

                    // Questions — uses your uploaded QuizQuestion widget
                    ...List.generate(lesson.questions.length, (qi) {
                      final q = lesson.questions[qi];
                      return Obx(() => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: QuizQuestion(
                          question: q.question,
                          options: q.options,
                          selectedIndex:
                          controller.selectedAnswers[qi] ?? -1,
                          correctIndex: controller.quizSubmitted.value
                              ? q.correctIndex
                              : -1,
                          submitted: controller.quizSubmitted.value,
                          onSelect: (i) =>
                              controller.selectAnswer(qi, i),
                        ),
                      ));
                    }),

                    const SizedBox(height: 8),

                    // Submit or Score
                    Obx(() => controller.quizSubmitted.value
                        ? ScoreCard(
                      correct: controller.correctCount,
                      total: lesson.questions.length,
                      hasNext: controller.hasNextLesson,
                      onNext: controller.goToNextLesson,
                    )
                        : ListeningSubmitButton(
                      label: "Submit",
                      onPressed: controller.submitQuiz,
                    )),

                    const SizedBox(height: 32),
                  ],
                );
              }),
            ],
          ),
        );
      }),
    );
  }

  String _fmt(double s) {
    if (s <= 0) return "0:00";
    return "${s ~/ 60}:${(s.toInt() % 60).toString().padLeft(2, '0')}";
  }
}
