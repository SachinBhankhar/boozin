import 'package:boozin/app/utils/colors.dart';
import 'package:boozin/app/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/strings.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_list_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  AppStrings.hi,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => controller.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.orangeColor,
                        ),
                      )
                    : Column(
                        children: [
                          HomeListItem(
                            title: "${AppStrings.steps}:",
                            trailingImagePath: ImagePath(context).iconSteps,
                            count: controller.steps.value,
                            goal: 15000,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          HomeListItem(
                            goal: 1000,
                            title: "${AppStrings.caloriesBurned}:",
                            trailingImagePath: ImagePath(context).iconKcal,
                            count: controller.calories.value,
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
