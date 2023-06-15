import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/custom_svg_image.dart';
import 'package:madaapp/presentation/splash/view_model/SplashController.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff473e9c),
            Color(0xff191540),
          ],
          begin: Alignment.topCenter, // set the gradient start point
          end: Alignment.bottomCenter, // set the gradient end point
        )),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.h,
              width: 192.w,
              child: const CustomSvgImage(image: AssetsManager.appIcon),
            ),
          ],
        ),
      ),
    );
  }
}
