// import 'package:get/get.dart';
// import '../../screens/Writing/Nav_pages/application_page.dart';
// import '../../screens/Writing/Nav_pages/email_page.dart';
// import '../../screens/Writing/Nav_pages/essay_page.dart';
// import '../../screens/Writing/Nav_pages/professional_communication_page.dart';
// import '../../screens/Writing/Nav_pages/report_page.dart';
//
// class WritingController extends GetxController {
//
//   /// Topics List
//   final topics = [
//     "Formal/Informal E-mails",
//     "Reports",
//     "Applications/CV",
//     "Essays",
//     "Professional Communication"
//   ];
//
//   /// Selected index
//   var selectedIndex = 0.obs;
//
//   /// Select topic
//   void selectTopic(int index) {
//     selectedIndex.value = index;
//     navigateToPage(index);
//   }
//
//   /// Navigation based on index
//   void navigateToPage(int index) {
//
//     switch(index){
//
//       case 0:
//         Get.to(() => FormalEmailPage());
//         break;
//
//       case 1:
//         Get.to(() => ReportPage());
//         break;
//
//       case 2:
//         Get.to(() => ApplicationPage());
//         break;
//
//       case 3:
//         Get.to(() => EssayPage());
//         break;
//
//       case 4:
//         Get.to(() => ProfessionalCommunicationPage());
//         break;
//
//     }
//
//   }
//
// }
import 'package:atlas_learning/src/data/models/model.dart';
import 'package:atlas_learning/src/services/data_service.dart';
import 'package:get/get.dart';
import '../../screens/Writing/Nav_pages/application_page.dart';
import '../../screens/Writing/Nav_pages/email_page.dart';
import '../../screens/Writing/Nav_pages/essay_page.dart';
import '../../screens/Writing/Nav_pages/professional_communication_page.dart';
import '../../screens/Writing/Nav_pages/report_page.dart';

class WritingController extends GetxController {
  final DataService _service = DataService();

  var writingData = Rxn<Map<String, WritingModel>>();

  /// Topics list — keys must match JSON order
  final topicKeys = [
    "formal_informal_emails",
    "reports",
    "applications_cv",
    "essays",
    "professional_communication",
  ];

  var selectedIndex = 0.obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    final data = await _service.loadLocalData();
    writingData.value = data.writing;
  }

  /// Get question for a given key
  String getQuestion(String key) {
    return writingData.value?[key]?.question ?? "";
  }

  /// Get title for a given key
  String getTitle(String key) {
    return writingData.value?[key]?.title ?? "";
  }

  /// Topics list for UI (driven from JSON titles)
  List<String> get topics {
    if (writingData.value == null) return [];
    return topicKeys.map((key) => getTitle(key)).toList();
  }

  void selectTopic(int index) {
    selectedIndex.value = index;
    navigateToPage(index);
  }

  void navigateToPage(int index) {
    final key = topicKeys[index];
    final question = getQuestion(key);

    switch (index) {
      case 0:
        Get.to(() => FormalEmailPage(question: question));
        break;
      case 1:
        Get.to(() => ReportPage(question: question));
        break;
      case 2:
        Get.to(() => ApplicationPage(question: question));
        break;
      case 3:
        Get.to(() => EssayPage(question: question));
        break;
      case 4:
        Get.to(() => ProfessionalCommunicationPage(question: question));
        break;
    }
  }
}