import 'package:boozin/app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../main.dart';

class HomeController extends GetxController {
  List<HealthDataPoint> healthData = <HealthDataPoint>[].obs;
  Rx<int> steps = 0.obs;
  Rx<int> calories = 0.obs;
  Rx<bool> loading = true.obs;
  @override
  void onInit() {
    getHealthData();
    super.onInit();
  }

  void getHealthData() async {
    ///requesting for permissions
    await Permission.activityRecognition.request();
    HealthFactory health = HealthFactory();
    var types = [HealthDataType.ACTIVE_ENERGY_BURNED, HealthDataType.STEPS];

    ///auth
    final requested = await health.requestAuthorization(types, permissions: [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ]);
    if (requested) {
      try {
        final now = DateTime.now();
        //getting data from google fit/ HealthKit
        healthData = await health.getHealthDataFromTypes(
            now.subtract(const Duration(days: 1)), now, types);
        //Assign calories
        calories.value =
            (healthData.first.value as NumericHealthValue).numericValue.toInt();
        //Assign Steps
        calories.value =
            (healthData.first.value as NumericHealthValue).numericValue.toInt();
        loading.value = false;
      } catch (e) {
        showError(AppStrings.errorNoData);
      }
    } else {
      showError(AppStrings.authError);
    }
  }

  void showError(String text) {
    loading.value = false;
    ScaffoldMessenger.of(navigatorKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
