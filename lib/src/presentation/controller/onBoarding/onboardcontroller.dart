import 'dart:developer';

import 'package:atlas_learning/src/data/models/model.dart';
import 'package:atlas_learning/src/services/data_service.dart';
import 'package:get/state_manager.dart';

class Onboardcontroller extends GetxController {
  final DataService _service = DataService();

  var data = Rxn<LearningModel>();
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    data.value = await _service.loadLocalData();

    final firstQuestion =
        data.value?.listening["news_lectures"]?.questions.first.question;

    log("First Question: $firstQuestion");
  }
}
