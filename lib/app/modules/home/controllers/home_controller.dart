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
    var types = [
      HealthDataType.STEPS,
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ];

    ///auth
    final requested = await health.requestAuthorization(types, permissions: [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ]);
    if (requested) {
      try {
        final now = DateTime.now();
        final midnight = DateTime(now.year, now.month, now.day);

        //getting data from google fit/ HealthKit
        healthData = await health.getHealthDataFromTypes(midnight, now, types);

        ///Assign calories
        //in case of mutiple data objects
        final caloriesList = healthData
            .where((element) =>
                element.type == HealthDataType.ACTIVE_ENERGY_BURNED)
            .toList();
        //sorting to get latest
        caloriesList.sort((a, b) => a.dateTo.compareTo(b.dateTo));
        calories.value = (caloriesList.last.value as NumericHealthValue)
            .numericValue
            .toInt();

        //Assign Steps
        steps.value =
            (await health.getTotalStepsInInterval(midnight, now)) ?? 0;

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
