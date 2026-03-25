import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ReadingController extends GetxController {
  final topics = [
    "Emails, reports, articles",
    "Forms & documents",
    "Business texts",
    "Academic materials",
  ];

  final reports = [
    "Weather reports are an important part of daily life...",
    "Forms and documents are used to collect and store information...",
    "Business texts are used in professional communication...",
    "Academic materials are used in education and research...",
  ];

  /// Selected topic
  RxInt selectedIndex = 0.obs;

  void selectTopic(int index) {
    selectedIndex.value = index;
  }

  /// Recorder
  final recorderController = RecorderController();
  RxBool isRecording = false.obs;

  /// RECORDINGS PER TOPIC
  RxMap<int, List<String>> recordingsMap =
      <int, List<String>>{}.obs;

  /// ▶️ Player
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentlyPlaying = ''.obs;

  @override
  void onInit() {
    super.onInit();

    /// initialize lists for each topic
    for (int i = 0; i < topics.length; i++) {
      recordingsMap[i] = [];
    }

    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        isPlaying.value = false;
        currentlyPlaying.value = '';
      }
    });
  }

  /// 📂 Get folder per topic
  Future<Directory> _getTopicDirectory() async {
    final dir = await getApplicationDocumentsDirectory();

    final topicName = topics[selectedIndex.value]
        .replaceAll(' ', '_')
        .replaceAll(',', '');

    final topicDir = Directory('${dir.path}/$topicName');

    if (!await topicDir.exists()) {
      await topicDir.create(recursive: true);
    }

    return topicDir;
  }

  /// ▶️ START RECORDING
  Future<void> startRecording() async {
    await recorderController.checkPermission();

    final topicDir = await _getTopicDirectory();

    final path =
        '${topicDir.path}/rec_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await recorderController.record(path: path);

    isRecording.value = true;
  }

  /// ⏹ STOP RECORDING
  Future<void> stopRecording() async {
    final path = await recorderController.stop();

    if (path != null) {
      recordingsMap[selectedIndex.value]!.add(path);
      recordingsMap.refresh(); // 👈 IMPORTANT
    }

    isRecording.value = false;
  }

  /// ❌ CANCEL
  Future<void> cancelRecording() async {
    await recorderController.stop();
    isRecording.value = false;
  }

  /// ▶️ PLAY
  Future<void> playAudio(String path) async {
    if (currentlyPlaying.value == path && isPlaying.value) {
      await player.stop();
      isPlaying.value = false;
      currentlyPlaying.value = '';
      return;
    }

    await player.setFilePath(path);
    await player.play();

    currentlyPlaying.value = path;
    isPlaying.value = true;
  }

  /// 🗑 DELETE
  void deleteRecording(int index) {
    recordingsMap[selectedIndex.value]!.removeAt(index);
    recordingsMap.refresh();
  }

  /// 📌 GET CURRENT LIST (helper for UI)
  List<String> get currentRecordings =>
      recordingsMap[selectedIndex.value] ?? [];

  @override
  void onClose() {
    recorderController.dispose();
    player.dispose();
    super.onClose();
  }
}