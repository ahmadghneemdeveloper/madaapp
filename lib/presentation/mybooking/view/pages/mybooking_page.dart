import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/custom_assets_image.dart';
import 'package:madaapp/presentation/component/custom_text.dart';
import 'package:madaapp/presentation/component/spaces.dart';
import 'package:madaapp/core/resources/bottom_navigationBar.dart' as navbar;

import '../../../../config/navigation/routes.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({Key? key}) : super(key: key);

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorCode343434,
      body: SafeArea(
          child: Column(children: [
        //appBar
        Stack(
          children: [
            Center(
              child: SizedBox(
                height: 200.h,
                width: 350.w,
                child: const CustomAssetsImage(
                    image: AssetsManager.world, boxFit: BoxFit.fitWidth),
              ),
            ),
            Row(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Padding(
                  padding: EdgeInsets.only(
                    left: 40.w
                  ),
                  child: CustomAssetsImage(
                    image: AssetsManager.notfication,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: CustomText(
                      text: "حجوزات الطيران",
                      textStyle: TextStyle(
                          color: ColorManager.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 30.w,
                ),
                GestureDetector(
                  onTap: () {
                    NavigationService.pushReplacement(
                        context, Routes.homeScreen);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(  right: 40.w),
                    child: const CustomAssetsImage(
                      image: AssetsManager.backicon,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),

        //body

        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w,),
          decoration: BoxDecoration(
            color: ColorManager.white,
          ),
          child: Column(
            children: [
              VerticalSpace(50.h),
               SizedBox(
                height: 250.h,
                width: 307.w,
                child: const CustomAssetsImage(
                    image: AssetsManager.background_booking, boxFit: BoxFit.fill),
              ),

              VerticalSpace(20.h),
              CustomText(
                text: "لاتوجد لديك أي حجوزات",
                textStyle: TextStyle(
                    color: ColorManager.colorCode0F181F,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              ),
              VerticalSpace(10.h),
              CustomText(
                text: "قم بحجز تذاكر سفرك بكل سهولة",
                textStyle: TextStyle(
                    color: ColorManager.colorgray,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              ),
              VerticalSpace(50.h),
              Button('الحجوزات', 1.2, () {
                HapticFeedback.lightImpact();

                NavigationService.pushReplacement(context, Routes.flightreservations);
              }, ColorManager.colorCode5E57BE),
              navbar.BottomNavigationBar(currentIndex: 1),
            ],
          ),
        ))
      ])),
    );
  }

  Widget Button(
      String string, double width, VoidCallback voidCallback, Color? colors) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
      child: Container(
        height: size.width / 8,
        width: size.width / width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          string,
          style:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
