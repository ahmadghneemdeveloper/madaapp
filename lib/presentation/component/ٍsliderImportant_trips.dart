import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/custom_assets_image.dart';
import 'package:madaapp/presentation/component/custom_text.dart';

class SliderImportant extends StatefulWidget {
  @override
  _SliderImportantState createState() => _SliderImportantState();
}

class _SliderImportantState extends State<SliderImportant> {
  int activeIndex = 0;



  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            setState(() {
              activeIndex = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            height: 200,
            width: 320,
            decoration: BoxDecoration(
                color: activeIndex == index
                    ? ColorManager.colorCode5E57BE
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //price
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: "400\$",
                        textStyle: TextStyle(
                          color: ColorManager.colorCodeFCBD5D,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      CustomText(
                        text: "سعر التذكرة  ",
                        textStyle: TextStyle(
                          color: activeIndex == index
                              ? Colors.white
                              : ColorManager.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                // wrap the container with edges
                Container(
                  height: 200.h,
                  width: 30.w,
                  child: const CustomAssetsImage(
                    image: AssetsManager.airplanslide,
                    boxFit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                // wrap the container with edges
                Container(
                  child: Column(
                    children: [
                      CustomText(
                        text: "عدن",
                        textStyle: TextStyle(
                          color: activeIndex == index
                              ? Colors.white
                              : ColorManager.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomText(
                        text: "12:00 pm",
                        textStyle: TextStyle(
                          color: activeIndex == index
                              ? Colors.white
                              : ColorManager.gray,
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //logo comp
                      Container(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(AssetsManager.airlogo),
                        ),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      CustomText(
                        text: "القاهرة",
                        textStyle: TextStyle(
                          color: activeIndex == index
                              ? Colors.white
                              : ColorManager.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomText(
                        text: "02:00 pm",
                        textStyle: TextStyle(
                          color: activeIndex == index
                              ? Colors.white
                              : ColorManager.gray,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.587,
        enlargeCenterPage: false,
        onPageChanged: (index, reason) {
          setState(() {
            activeIndex = index;
          });
        },
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 5),
      ),
    );
  }

  Widget buildImage(String sliders, int index) => Container(
        width: 200.w,
        height: 320.h,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 90,
            ),
          ],
        ),
      );
}
