import 'dart:developer';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:just_audio/just_audio.dart';

import '../../../data/models/model.dart';
import '../../../services/data_service.dart';
import '../../screens/Listening/Lis_nav_pages/listening_player.dart';

class ListeningController extends GetxController {

  final DataService _service = DataService();

  // ── Raw data ─────────────────────────────────────────────
  var sectionsData = <ListeningSectionModel>[].obs;

  // ── Index state ──────────────────────────────────────────
  var selectedSectionIndex = 0.obs;
  var currentLessonIndex   = 0.obs;

  // ── Topics (titles from JSON directly) ───────────────────
  List<String> get topics =>
      sectionsData.map((e) => e.title).toList();

  // ── Lessons of selected section ──────────────────────────
  List<ListeningLesson> get currentLessons =>
      sectionsData[selectedSectionIndex.value].lessons;

  ListeningLesson get currentLesson =>
      currentLessons[currentLessonIndex.value];

  bool get hasNextLesson =>
      currentLessonIndex.value < currentLessons.length - 1;

  bool get hasPrevLesson =>
      currentLessonIndex.value > 0;

  // ── Quiz ────────────────────────────────────────────────
  var selectedAnswers = <int, int>{}.obs;
  var quizVisible     = false.obs;
  var quizSubmitted   = false.obs;

  // ── Audio ───────────────────────────────────────────────
  final AudioPlayer player = AudioPlayer();

  var isPlaying = false.obs;
  var position  = 0.0.obs;
  var duration  = 0.0.obs;
  var isLoaded  = false.obs;

  @override
  void onInit() {
    super.onInit();
    _attachStreams();
    _loadData();
  }

  // ✅ LOAD DATA (converted Map → List)
  Future<void> _loadData() async {
    final data = await _service.loadListeningData();

    // Convert Map → List (THIS IS THE KEY FIX)
    sectionsData.value = data.values.toList();

    log("✅ Loaded sections: ${sectionsData.length}");
  }

  void _attachStreams() {
    player.durationStream.listen((d) {
      if (d != null) duration.value = d.inSeconds.toDouble();
    });
    player.positionStream.listen((p) {
      position.value = p.inSeconds.toDouble();
    });
    player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
    });
  }

  // ── LOAD AUDIO ──────────────────────────────────────────
  Future<void> _loadLesson(ListeningLesson lesson) async {
    try {
      isLoaded.value      = false;
      quizVisible.value   = false;
      quizSubmitted.value = false;
      selectedAnswers.clear();
      position.value      = 0.0;
      duration.value      = 0.0;

      await player.stop();

      await player.setUrl(_convertDriveUrl(lesson.audioUrl));
      await player.load();

      isLoaded.value = true;
    } catch (e) {
      log('❌ Audio load error: $e');
    }
  }

  // ✅ Convert Google Drive URL → playable
  String _convertDriveUrl(String url) {
    if (url.contains("drive.google.com")) {
      final id = url.split('/d/')[1].split('/')[0];
      return "https://drive.google.com/uc?export=download&id=$id";
    }
    return url;
  }

  // ── NAVIGATION ──────────────────────────────────────────
  void selectTopic(int index) {
    selectedSectionIndex.value = index;
    currentLessonIndex.value   = 0;

    _loadLesson(currentLessons.first);

    Get.to(() => ListeningPlayerPage());
  }

  Future<void> goToNextLesson() async {
    if (!hasNextLesson) return;
    currentLessonIndex.value++;
    await _loadLesson(currentLesson);
  }

  Future<void> goToPrevLesson() async {
    if (!hasPrevLesson) return;
    currentLessonIndex.value--;
    await _loadLesson(currentLesson);
  }

  // ── QUIZ ────────────────────────────────────────────────
  void showQuiz() => quizVisible.value = true;

  void selectAnswer(int q, int a) {
    if (quizSubmitted.value) return;
    selectedAnswers[q] = a;
    selectedAnswers.refresh();
  }

  void submitQuiz() {
    if (selectedAnswers.length < currentLesson.questions.length) return;
    quizSubmitted.value = true;
  }

  int get correctCount {
    int count = 0;
    for (int i = 0; i < currentLesson.questions.length; i++) {
      if (selectedAnswers[i] ==
          currentLesson.questions[i].correctIndex) {
        count++;
      }
    }
    return count;
  }

  // ── AUDIO CONTROLS ──────────────────────────────────────
  void playPause() =>
      player.playing ? player.pause() : player.play();

  void seek(double v) =>
      player.seek(Duration(seconds: v.toInt()));

  void forward() {
    final t = player.position + const Duration(seconds: 10);
    final m = player.duration ?? Duration.zero;
    player.seek(t > m ? m : t);
  }

  void backward() {
    final t = player.position - const Duration(seconds: 10);
    player.seek(t < Duration.zero ? Duration.zero : t);
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
