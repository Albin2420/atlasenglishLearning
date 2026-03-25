import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/Reading/reading_controller.dart';

class PassageView extends StatelessWidget {
  const PassageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ReadingController>();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Read the passage"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [

              /// 📖 PASSAGE
              Obx(() => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffCFFF9C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  ctrl.reports[ctrl.selectedIndex.value],
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),

              const SizedBox(height: 16),

              /// 🎧 RECORDINGS LIST
              Expanded(
                child: Obx(() {
                  if (ctrl.currentRecordings.isEmpty) {
                    return const SizedBox();
                  }

                  return ListView.builder(
                    itemCount: ctrl.currentRecordings.length,
                    itemBuilder: (context, index) {
                      final path = ctrl.currentRecordings[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ListTile(
                          leading: Obx(() {
                            final isPlaying =
                                ctrl.currentlyPlaying.value == path &&
                                    ctrl.isPlaying.value;

                            return Icon(
                              isPlaying ? Icons.stop : Icons.play_arrow,
                              color: Colors.black,
                            );
                          }),
                          title: Text(
                            "Recording ${index + 1}",
                            style: GoogleFonts.poppins(),
                          ),
                          subtitle: const Text("Tap to play"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              ctrl.deleteRecording(index);
                            },
                          ),
                          onTap: () {
                            ctrl.playAudio(path);
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),

      /// 🎤 MIC + WAVEFORM
      bottomNavigationBar: SafeArea(
        child: Obx(() {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Row(
              children: [
                /// 🎤 MIC
                GestureDetector(
                  onLongPressStart: (_) => ctrl.startRecording(),
                  onLongPressEnd: (_) => ctrl.stopRecording(),
                  onHorizontalDragUpdate: (details) {
                    if (details.delta.dx < -5) {
                      ctrl.cancelRecording();
                    }
                  },
                  child: Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ctrl.isRecording.value
                          ? Colors.red
                          : Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.mic, color: Colors.white),
                  ),
                ),

                const SizedBox(width: 10),

                /// 🎚 REAL WAVEFORM
                Expanded(
                  child: ctrl.isRecording.value
                      ? AudioWaveforms(
                    recorderController: ctrl.recorderController,
                    size: const Size(double.infinity, 50),
                    waveStyle: const WaveStyle(
                      waveColor: Colors.red,
                      extendWaveform: true,
                      showMiddleLine: false,
                      waveThickness: 3,
                      spacing: 4,
                    ),
                  )
                      : const SizedBox(),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}