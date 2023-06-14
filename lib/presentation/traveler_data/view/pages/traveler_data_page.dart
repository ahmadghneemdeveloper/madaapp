import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/resources/font_manager.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/components.dart';
import 'package:madaapp/presentation/component/custom_assets_image.dart';
import 'package:madaapp/presentation/component/custom_text.dart';
import 'package:madaapp/presentation/component/custom_text_field.dart';
import 'package:madaapp/presentation/component/spaces.dart';

import '../../../../config/navigation/routes.dart';

class TravelerData extends StatefulWidget {
  const TravelerData({Key? key}) : super(key: key);

  @override
  State<TravelerData> createState() => _TravelerDataState();
}

class _TravelerDataState extends State<TravelerData> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.colorCode343434,
      body: SafeArea(
          child: Column(children: [
        //appBar
        Stack(
          children: [
            Container(
              height: 220.h,
              width: double.infinity,
              color: ColorManager.colorCode343434,
            ),
            Center(
              child: SizedBox(
                height: 220.h,
                width: double.infinity,
                child: const CustomAssetsImage(
                    image: AssetsManager.world, boxFit: BoxFit.fitWidth),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: const CustomAssetsImage(
                    image: AssetsManager.notfication,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: 'القاهرة',
                            textStyle: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          CustomAssetsImage(
                            image: AssetsManager.path,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          CustomText(
                            text: 'عدن',
                            textStyle: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          )
                        ],
                      ),
                      CustomText(
                        text: '8 سبتمبر -14 سبتمبر | 5 مسافرين',
                        textStyle: TextStyle(
                          color: ColorManager.white,
                          fontSize: 15.sp,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    NavigationService.goBack(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 30.w),
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

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(10.h),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0.w, top: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: "بيانات المسافرين",
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeightManager.semiBold,
                                  color: ColorManager.black),
                        ),
                        CustomText(
                          text: "فضلا ادخل بيانات المسافرين",
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeightManager.semiBold,
                                  color: ColorManager.gray),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalSpace(20.h),
                TapEffect(
                  onClick: (){
                    NavigationService.pushReplacement(context, Routes.travelerinput);
                    },
                  child: Container(
                    height: size.width / 8,
                    width: size.width / 0.22,
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      color: ColorManager.colorButton,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      readOnly: true,
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: ColorManager.white),
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () { NavigationService.pushReplacement(context, Routes.travelerinput);},
                              child:  Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Icon(Icons.arrow_back_ios_new),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 180.0.w),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText(
                                          text: 'المسافر (1)',
                                          textStyle: TextStyle(
                                              color: ColorManager.colorcard,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp)),
                                      CustomText(
                                          text: 'كبير',
                                          textStyle: TextStyle(
                                              color: ColorManager.colorcard,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)),
                                    ],
                                  ),
                                  Image.asset(
                                    AssetsManager.traveler_icone,
                                    width: size.width / 12,
                                    height: size.width / 12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                VerticalSpace(20.h),
                TapEffect(
                  onClick: (){   NavigationService.pushReplacement(context, Routes.travelerinput);},
                  child: Container(
                    height: size.width / 8,
                    width: size.width / 0.22,
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      color: ColorManager.colorButton,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      readOnly: true,
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: ColorManager.white),
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () { NavigationService.pushReplacement(context, Routes.travelerinput);},
                              child:  Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Icon(Icons.arrow_back_ios_new),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 180.0.w),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText(
                                          text: 'المسافر (2)',
                                          textStyle: TextStyle(
                                              color: ColorManager.colorcard,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp)),
                                      CustomText(
                                          text: 'كبير',
                                          textStyle: TextStyle(
                                              color: ColorManager.colorcard,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)),
                                    ],
                                  ),
                                  Image.asset(
                                    AssetsManager.traveler_icone,
                                    width: size.width / 12,
                                    height: size.width / 12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                VerticalSpace(20.h),
                TapEffect(onClick: (){   NavigationService.pushReplacement(context, Routes.travelerinput);},
                  child: Container(
                    height: size.width / 8,
                    width: size.width / 0.22,
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      color: ColorManager.colorButton,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      readOnly: true,
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: ColorManager.white),
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () { NavigationService.pushReplacement(context, Routes.travelerinput);},
                              child:  Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Icon(Icons.arrow_back_ios_new),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:  180.0.w),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText(
                                          text: 'المسافر (3)',
                                          textStyle: TextStyle(
                                              color: ColorManager.colorcard,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp)),
                                      CustomText(
                                          text: 'طفل',
                                          textStyle: TextStyle(
                                              color: ColorManager.colorcard,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)),
                                    ],
                                  ),
                                  Image.asset(
                                    AssetsManager.traveler_icone,
                                    width: size.width / 12,
                                    height: size.width / 12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                VerticalSpace(20.h),
                TapEffect(
                  onClick: (){   NavigationService.pushReplacement(context, Routes.travelerinput);},
                  child: Container(
                    height: size.width / 8,
                    width: size.width / 0.22,
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      color: ColorManager.colorButton,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      readOnly: true,
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: ColorManager.white),
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () { NavigationService.pushReplacement(context, Routes.travelerinput);},
                              child:  Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Icon(Icons.arrow_back_ios_new),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:  180.0.w),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText(
                                          text: 'المسافر (4)',
                                          textStyle: TextStyle(
                                              color: ColorManager.colorcard,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp)),
                                      CustomText(
                                          text: 'طفل',
                                          textStyle: TextStyle(
                                              color: ColorManager.colorcard,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)),
                                    ],
                                  ),
                                  Image.asset(
                                    AssetsManager.traveler_icone,
                                    width: size.width / 12,
                                    height: size.width / 12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                VerticalSpace(20.h),
                TapEffect(onClick: (){   NavigationService.pushReplacement(context, Routes.travelerinput);},
                  child: Container(
                    height: size.width / 8,
                    width: size.width / 0.22,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorManager.colorButton,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      readOnly: true,
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: ColorManager.white),
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () { NavigationService.pushReplacement(context, Routes.travelerinput);},
                              child:  Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Icon(Icons.arrow_back_ios_new),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 180.0.w),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText(
                                          text: 'المسافر (5)',
                                          textStyle: TextStyle(
                                              color: ColorManager.colorcard,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp)),
                                      CustomText(
                                          text: 'رضيع',
                                          textStyle: TextStyle(
                                              color: ColorManager.colorcard,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)),
                                    ],
                                  ),
                                  Image.asset(
                                    AssetsManager.traveler_icone,
                                    width: size.width / 12,
                                    height: size.width / 12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                VerticalSpace(20.h),

                Button('التالي', 1.2, () {
                  HapticFeedback.lightImpact();



                  NavigationService.pushReplacement(
                      context, Routes.pricingdetails);


                }, ColorManager.colorCode5E57BE),
                VerticalSpace(90.h),
              ],
            ),
          )),
        )
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 200.0.w),
              child: const Icon(
                Icons.arrow_circle_left_outlined,
                color: ColorManager.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 14.0.w),
              child: Text(
                string,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
