import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/navigation/routes.dart';

class WittingPage extends StatefulWidget {
  const WittingPage({super.key});

  @override
  _WittingPageState createState() => _WittingPageState();
}

class _WittingPageState extends State<WittingPage>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (forward) {
          activeIndex++;
        } else {
          activeIndex--;
        }
        if (activeIndex == 5) {
          forward = false;

          NavigationService.pushReplacement(context, Routes.ticketsavailable);
        } else if (activeIndex == 0) {
          forward = true;
        }
      });
    });
  }

  @override
  void dispose() {
    // pageController.dispose();
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.colorCode343434,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              //appBar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50.0, left: 20.w),
                    child: const CustomAssetsImage(
                      image: AssetsManager.notfication,
                    ),
                  ),
                  SizedBox(
                    width: 200.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      NavigationService.goBack(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.0, right: 20.w),
                      child: const CustomAssetsImage(
                        image: AssetsManager.backicon,
                      ),
                    ),
                  ),
                ],
              ),

              //body
              SizedBox(
                height: 300.h,
                width: 250.w,
                child: const CustomAssetsImage(
                    image: AssetsManager.planwitting, boxFit: BoxFit.fitWidth),
              ),
              Column(
                children: [
                  buildIndicator(),
                  VerticalSpace(25.h),
                  CustomText(
                    text: 'يرجى الانتظار',
                    textStyle: TextStyle(
                        color: ColorManager.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              VerticalSpace(40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
                child: Stack(
                  children: [
                    Container(
                      height: 220.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                          color: ColorManager.colorCode5E57BE,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ]),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 18.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'القاهرة',
                                textStyle: TextStyle(
                                    color: ColorManager.white,

                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ),
                              SizedBox(
                                width: 100.w,
                              ),
                              CustomText(
                                text: 'عدن',
                                textStyle: TextStyle(
                                    color: ColorManager.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ),

                            ],
                          ),
                          Image.asset(
                            AssetsManager.rowarrow,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: '2021\nسبتمر',
                                        textStyle: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      CustomText(
                                        text: '14',
                                        textStyle: TextStyle(
                                            color: ColorManager.colorCodeFCBD5D,
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(
                                width: 100.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: '2021\nسبتمر',
                                        textStyle: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      CustomText(
                                        text: '8',
                                        textStyle: TextStyle(
                                            color: ColorManager.colorCodeFCBD5D,
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              VerticalSpace(40.h),
            ]),
          ),
        ));
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        count: 5,
        activeIndex: activeIndex,
        effect: const SlideEffect(
            spacing: 8.0,
            radius: 50,
            dotWidth: 20.0,
            dotHeight: 20.0,
            paintStyle: PaintingStyle.stroke,
            strokeWidth: 1.5,
            activeDotColor: ColorManager.colorCodeFCBD5D),
      );
  int activeIndex = 0;
  bool forward = true;
  Timer? _timer;
}
