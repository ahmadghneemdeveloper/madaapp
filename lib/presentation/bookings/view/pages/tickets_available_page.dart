import 'package:flutter/material.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/bookings/view/components/tickets_card.dart';
import 'package:madaapp/presentation/component/custom_assets_image.dart';
import 'package:madaapp/presentation/component/custom_text.dart';


class TicketsAvailable extends StatefulWidget {
  const TicketsAvailable({Key? key}) : super(key: key);

  @override
  State<TicketsAvailable> createState() => _TicketsAvailableState();
}

class _TicketsAvailableState extends State<TicketsAvailable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
          child: Column(children: [
            //appBar
            Stack(
              children: [
                Container(
                  height: 250.h,
                  width: double.infinity,
                  color:ColorManager.colorCode343434 ,
                ),
                Center(
                  child: SizedBox(
                    height: 250.h,
                    width: double.infinity,
                    child: const CustomAssetsImage(
                        image: AssetsManager.world, boxFit: BoxFit.fitWidth),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.w,top: 20.h),
                      child: const CustomAssetsImage(
                        image: AssetsManager.notfication,
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top: 18.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              CustomText(
                                text: 'ذهاب وعودة',
                                textStyle: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 15.sp,
                                    ),
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 80.h,
                                child: Image.asset(
                                  AssetsManager.bookingicon,
                                ),
                              ),
                              CustomText(
                                text: 'درجة رجال الأعمال',
                                textStyle: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 15.sp,),
                              )
                            ],
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
                                  CustomText(
                                    text: 'القاهرة',
                                    textStyle: TextStyle(
                                        color: ColorManager.white,

                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp),
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
                                  CustomText(
                                    text: 'عدن',
                                    textStyle: TextStyle(
                                        color: ColorManager.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        NavigationService.goBack(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.w,top: 20.h),
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
            TicketsCard()
          ])),
    );
  }
}
