import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/image_path.dart';
import '../../../utils/opacity_animation.dart';
import '../../../utils/strings.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool visible = false;
  bool alignLogo = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      _animate();
    });
  }

  Future<void> _animate() async {
    setState(() => alignLogo = !alignLogo);
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => visible = true);
    await Future.delayed(const Duration(seconds: 1));
    //Navigate to home page
    Get.toNamed(Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(210, 80)),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 500),
                    alignment:
                        alignLogo ? const Alignment(0.61, 0) : Alignment.center,
                    child: Image.asset(
                      ImagePathCommon.splashI,
                    ),
                  ),
                  if (alignLogo)
                    OpacityAnimation(
                      visible: visible,
                      child: Image.asset(ImagePath(context).splashBoozin),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            OpacityAnimation(
              visible: visible,
              child: const Text(
                AppStrings.fitness,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
