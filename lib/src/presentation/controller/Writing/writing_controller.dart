import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../data/models/model.dart';
import '../../../services/data_service.dart';
import '../../screens/Writing/Nav_pages/application_page.dart';
import '../../screens/Writing/Nav_pages/email_page.dart';
import '../../screens/Writing/Nav_pages/essay_page.dart';
import '../../screens/Writing/Nav_pages/professional_communication_page.dart';
import '../../screens/Writing/Nav_pages/report_page.dart';

class WritingController extends GetxController {

  final DataService _service = DataService();

  // ✅ Store as LIST instead of Map
  var writingList = <WritingModel>[].obs;

  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  // ✅ Convert Map → List
  Future<void> _loadData() async {
    final data = await _service.loadWritingData();

    writingList.value = data.values.toList();

    print("✅ Writing loaded: ${writingList.length}");
  }

  // ✅ Titles directly from JSON
  List<String> get topics =>
      writingList.map((e) => e.title).toList();

  // ✅ Question from selected item
  String get currentQuestion =>
      writingList[selectedIndex.value].question;

  // ── Navigation ──────────────────────────────────────────
  void selectTopic(int index) {
    selectedIndex.value = index;
    _navigateToPage(index);
  }

  void _navigateToPage(int index) {
    final question = writingList[index].question;

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
