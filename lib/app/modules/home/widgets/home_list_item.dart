import 'package:boozin/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:progress_indicator/progress_indicator.dart';

import '../../../utils/strings.dart';

class HomeListItem extends StatelessWidget {
  final String title;

  final String trailingImagePath;
  final num count;
  final num goal;
  const HomeListItem({
    super.key,
    required this.title,
    required this.trailingImagePath,
    required this.count,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final containerBackgroundColor =
        darkMode ? AppColor.cardBackgroundDark : AppColor.cardBackgroundLight;

    ///if percentage is more than 100 progress bar will overflow
    double percentage = (count / goal * 100);
    percentage = percentage > 100 ? 100 : percentage;

    return Container(
      decoration: BoxDecoration(
        color: containerBackgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title),
                    Text(" $count"),
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.65,
                  child: Column(
                    children: [
                      BarProgress(
                        margin: const EdgeInsets.only(
                          left: 8.0,
                          top: 24,
                          right: 8,
                        ),
                        percentage: percentage,
                        backColor: Colors.grey,
                        gradient: LinearGradient(
                          colors: [
                            darkMode ? Colors.white : Colors.black,
                            darkMode ? Colors.white : Colors.black
                          ],
                        ),
                        textStyle:
                            const TextStyle(color: Colors.orange, fontSize: 70),
                        stroke: 16,
                        round: true,
                        showPercentage: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            count.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${AppStrings.goal}: $goal",
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              trailingImagePath,
              color: darkMode ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
