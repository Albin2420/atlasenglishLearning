import 'package:get/get.dart';
import '../../screens/Writing/Nav_pages/application_page.dart';
import '../../screens/Writing/Nav_pages/email_page.dart';
import '../../screens/Writing/Nav_pages/essay_page.dart';
import '../../screens/Writing/Nav_pages/professional_communication_page.dart';
import '../../screens/Writing/Nav_pages/report_page.dart';

class WritingController extends GetxController {

  /// Topics List
  final topics = [
    "Formal/Informal E-mails",
    "Reports",
    "Applications/CV",
    "Essays",
    "Professional Communication"
  ];

  /// Selected index
  var selectedIndex = 0.obs;

  /// Select topic
  void selectTopic(int index) {
    selectedIndex.value = index;
    navigateToPage(index);
  }

  /// Navigation based on index
  void navigateToPage(int index) {

    switch(index){

      case 0:
        Get.to(() => FormalEmailPage());
        break;

      case 1:
        Get.to(() => ReportPage());
        break;

      case 2:
        Get.to(() => ApplicationPage());
        break;

      case 3:
        Get.to(() => EssayPage());
        break;

      case 4:
        Get.to(() => ProfessionalCommunicationPage());
        break;

    }

  }

}