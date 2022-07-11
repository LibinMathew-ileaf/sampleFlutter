import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../model/interest_hive.dart';

class DialogController extends GetxController {
  //TODO: Implement DialogController

  final count = 0.obs;
  final nameController = TextEditingController().obs;
  final idController = TextEditingController().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void saveInterests(){
    final interests = InterestHive()
      ..name = nameController.value.text
      ..id=idController.value.text
      ..createdAt = DateTime.now().millisecond
      ..updatedAt = DateTime.now().millisecond
      ..icon = "icon";

    final box =  Hive.box<InterestHive>('interest_hive');
    box.add(interests);
  }
}
