import 'package:get/get.dart';

class SpeakingController extends GetxController {

  /// Topics List
  final topics = [
    "Real-life conversations",
    "Workplace scenarios",
    "Meetings & presentations",
    "Problem-solving discussions",
    "Interview practice"
    "Public speaking"
  ];

  /// Selected index
  var selectedIndex = 0.obs;

  /// Select topic
  void selectTopic(int index) {
    selectedIndex.value = index;
  }
}