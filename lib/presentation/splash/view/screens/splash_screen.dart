import 'dart:async';
import 'package:flutter/material.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_values.dart';
import 'package:madaapp/core/services/local/shared_preferences_keys.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/data/provider/local_auth_provider.dart';
import 'package:madaapp/domain/logger.dart';
import 'package:madaapp/presentation/component/custom_svg_image.dart';
import 'package:madaapp/presentation/splash/view_model/refresh_token_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
    void initState() {
      getLocalData();
      super.initState();
    }

    void getLocalData() async {
      final storedData = Provider.of<LocalAuthProvider>(context, listen: false);
      bool? isLogin = await storedData.isLogin();
      final sharedPreferences = await SharedPreferences.getInstance();

      print("Token is ${sharedPreferences.getString(SharedPreferencesKeys.kToken)}");

      if (isLogin) {
        registerDeviceData();
         Timer(
            Time.t300,
        () => NavigationService.pushReplacement(context, Routes.homeScreen));
      } else {
        Timer(
          Time.t300,
              () => NavigationService.pushReplacement(context, Routes.loginScreen),
        );
      }
    }

    void registerDeviceData() async {
      final sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString(SharedPreferencesKeys.kToken).toString();
      print("Token in Splash: $token");
    }

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
