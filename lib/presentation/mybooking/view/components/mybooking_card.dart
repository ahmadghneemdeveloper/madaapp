import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/components.dart';

import '../../../../config/navigation/routes.dart';

class MybookingCard extends StatefulWidget {
  @override
  _MybookingCardState createState() => _MybookingCardState();
}

class _MybookingCardState extends State<MybookingCard> {
  @override
  Widget build(BuildContext c) {
    return Expanded(
      child: Container(
        color: ColorManager.colorgray2,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: FutureBuilder(
            future: fetchData(),
            builder: (ctx, data) {
              if (data.connectionState == ConnectionState.waiting ||
                  data.hasError) {
                return Center(child: MyProgressIndicator());
              } else {
                return ListView.builder(
                  padding: EdgeInsets.all(20.w),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 2,
                  itemBuilder: (BuildContext c, int i) {
                    return AnimationConfiguration.staggeredList(
                      position: i,
                      delay: const Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        horizontalOffset: 30,
                        verticalOffset: 300.0,
                        child: FlipAnimation(
                          duration: const Duration(milliseconds: 3000),
                          curve: Curves.fastLinearToSlowEaseIn,
                          flipAxis: FlipAxis.y,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 100.w,
                            height: 150.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                            child: TapEffect(
                               onClick: (){
                                 NavigationService.push(
                                     context, Routes.reservationsdetails);
                               },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        VerticalSpace(20.h),
                                        const CustomText(
                                            text: "400 \$",
                                            textStyle: TextStyle(
                                                color:
                                                    ColorManager.colorCodeFCBD5D,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25)),
                                        VerticalSpace(20.h),
                                        const CustomAssetsImage(
                                            image: AssetsManager.greyLine,
                                            boxFit: BoxFit.fitWidth),
                                        VerticalSpace(25.h),
                                        const CustomText(
                                            text: "مزيد من التفاصيل",
                                            textStyle: TextStyle(
                                                color: ColorManager.navy_blue,
                                                fontSize: 10))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  //yellowLine
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    child: CustomAssetsImage(
                                        image: AssetsManager.yellowLine,
                                        boxFit: BoxFit.fitWidth),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5.0),
                                                  child: CustomText(
                                                      text: "القاهرة",
                                                      textStyle: TextStyle(
                                                          color: ColorManager.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15.sp)),
                                                ),
                                                SizedBox(
                                                  width: 45.w,
                                                ),
                                                const CustomText(
                                                    text: "5 مسافرين",
                                                    textStyle: TextStyle(
                                                        color: ColorManager.purple,
                                                        fontSize: 10)),
                                                SizedBox(
                                                  width: 60.w,
                                                ),
                                                CustomText(
                                                    text: "عدن",
                                                    textStyle: TextStyle(
                                                        color: ColorManager.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15.sp)),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.0),
                                              child: CustomAssetsImage(
                                                  image: AssetsManager.destination,
                                                  boxFit: BoxFit.fitWidth),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              children:  [
                                                const CustomText(
                                                    text: "02:00 pm",
                                                    textStyle: TextStyle(
                                                        color: ColorManager.purple,
                                                        fontSize: 10)),
                                                SizedBox(width: 42.w,),
                                                const CircleAvatar(
                                                  backgroundImage: AssetImage(AssetsManager.airlogo),
                                                  radius: 18,
                                                ),
                                                SizedBox(width: 42.w,),
                                                const CustomText(
                                                    text: "12:00 pm",
                                                    textStyle: TextStyle(
                                                        color: ColorManager.purple,
                                                        fontSize: 10)),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children:  [
                                                const Padding(
                                                  padding: EdgeInsets.only(left:5.0),
                                                  child: CustomText(
                                                      text: "عدن",
                                                      textStyle: TextStyle(
                                                          color: ColorManager.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15)),
                                                ),
                                                SizedBox(
                                                  width: 45.w,
                                                ),
                                                const CustomText(
                                                    text: "درجة رجال الأعمال",
                                                    textStyle: TextStyle(
                                                        color: ColorManager.purple,
                                                        fontSize: 10)),
                                                SizedBox(
                                                  width: 40.w,
                                                ),
                                                const CustomText(
                                                    text: "القاهرة",
                                                    textStyle: TextStyle(
                                                        color: ColorManager.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15)),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.0),
                                              child: CustomAssetsImage(
                                                  image: AssetsManager.reverse_destination,
                                                  boxFit: BoxFit.fitWidth),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              children:  [
                                                const CustomText(
                                                    text: "02:00 pm",
                                                    textStyle: TextStyle(
                                                        color: ColorManager.purple,
                                                        fontSize: 10)),
                                                SizedBox(width: 115.w,),
                                                const CustomText(
                                                    text: "12:00 pm",
                                                    textStyle: TextStyle(
                                                        color: ColorManager.purple,
                                                        fontSize: 10)),
                                              ],
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List> fetchData() async {
    // replace this with your actual API call or data fetching logic
    List data = [
      AssetsManager.mybookingcard,
      AssetsManager.mybookingcard,
      AssetsManager.mybookingcard,
      AssetsManager.mybookingcard,
      AssetsManager.mybookingcard
    ];

    // simulate a delay to show the progress indicator
    await Future.delayed(const Duration(seconds: 2));

    return data;
  }
}
