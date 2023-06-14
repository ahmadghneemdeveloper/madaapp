import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/custom_text.dart';

class SliderPopular extends StatefulWidget {
  const SliderPopular({Key? key}) : super(key: key);

  @override
  State<SliderPopular> createState() => _SliderPopularState();
}

class _SliderPopularState extends State<SliderPopular> {
  int activeIndex = 0;

  final slider = [
    AssetsManager.card,
    AssetsManager.card,
    AssetsManager.card,
    AssetsManager.card,
    AssetsManager.card
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: slider.length,
      itemBuilder: (context, index, realIndex) {
        final sliders = slider[index];
        return Stack(
          children: [
            // cardImage
            buildImage(sliders, index),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
              child: Container(
                height: 70.h,
                width: 60.w,
                color: Colors.grey,
                child: Image.asset(
                  AssetsManager.airlogo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // cities
            Row(
             crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: "القاهرة",
                  textStyle: TextStyle(
                    color: ColorManager.colorCode0F181F,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  width: 80.w,
                ),
                CustomText(
                  text: "عدن",
                  textStyle: TextStyle(
                    color: ColorManager.colorCode0F181F,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                //price
                Padding(
                  padding:  EdgeInsets.only(right: 10.0.w,top: 10.h),
                  child: CustomText(
                    text: "400\$",
                    textStyle: TextStyle(
                      color: ColorManager.colorCode5E57BE,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
            // time
            Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 10),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "02:00 pm",
                      textStyle: TextStyle(
                        color: ColorManager.gray,
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(
                      width: 70.w,
                    ),
                    CustomText(
                      text: "12:00 pm",
                      textStyle: TextStyle(
                        color: ColorManager.gray,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        );
      },
      options: CarouselOptions(
        height: 200,
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

  Widget buildImage(String sliders, int index) => Expanded(
   flex: 2,
        child: Image.asset(
          sliders,
          fit: BoxFit.cover,
        ),
      );
}
