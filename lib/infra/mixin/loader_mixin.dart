import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

mixin LoaderMixin on GetxController {
  void loadrListener(RxBool loaderRx) {
    ever<bool>(loaderRx, (loading) async {
      if (loading) {
        await Get.dialog(const Center(child: CircularProgressIndicator()),
            barrierDismissible: false);
      } else {
        Get.back();
      }
    });
  }
}
