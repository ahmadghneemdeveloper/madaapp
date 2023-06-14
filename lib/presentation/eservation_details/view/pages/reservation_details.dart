import 'package:flutter/material.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/MySeparator.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/custom_assets_image.dart';
import 'package:madaapp/presentation/component/custom_text.dart';
import 'package:madaapp/core/resources/bottom_navigationBar.dart' as navbar;
import 'package:madaapp/presentation/component/spaces.dart';

class ReservationsDetails extends StatefulWidget {
  const ReservationsDetails({Key? key}) : super(key: key);

  @override
  State<ReservationsDetails> createState() => _ReservationsDetailsState();
}

class _ReservationsDetailsState extends State<ReservationsDetails> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorCode343434,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(children: [
          //appBar
          Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 320.h,
                  width: double.infinity,
                  child: const CustomAssetsImage(
                      image: AssetsManager.world, boxFit: BoxFit.cover),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomAssetsImage(
                          image: AssetsManager.notfication,
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        CustomText(
                            text: "تفاصيل الحجز",
                            textStyle: TextStyle(
                                color: ColorManager.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 70.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            NavigationService.goBack(context);
                          },
                          child: const CustomAssetsImage(
                            image: AssetsManager.backicon,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CustomAssetsImage(
                            image: AssetsManager.bookingicon,
                            width: 300.w,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: "   إلى\nالرياض",
                                textStyle: TextStyle(
                                    color: ColorManager.white, fontSize: 15.sp),
                              ),
                              const SizedBox(
                                width: 75,
                              ),
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage(AssetsManager.airlogo),
                                radius: 30,
                              ),
                              const SizedBox(
                                width: 75,
                              ),
                              CustomText(
                                text: " من\nعدن",
                                textStyle: TextStyle(
                                    color: ColorManager.white, fontSize: 15.sp),
                              )
                            ],
                          ),
                          VerticalSpace(20.h),
                          CustomText(
                            text: "الخطوط الجوية اليمنية",
                            textStyle: TextStyle(
                                color: ColorManager.white, fontSize: 15.sp),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),

          //body

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorManager.colorFCCB81,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CustomText(
                            text: 'درجة رجال الأعمال',
                            textStyle: TextStyle(
                                fontSize: 14.sp, color: ColorManager.white),
                          ),
                        )),
                    SizedBox(
                      width: 130.w,
                    ),
                    const CustomText(
                      text: 'مسافرين${4}',
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: ColorManager.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              VerticalSpace(20.h),
              Stack(
                children: [
                  Container(
                    height: 150.h,
                    color: ColorManager.colorcard,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              const CustomText(
                                  text: "تاريخ العوده",
                                  textStyle: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const CustomText(
                                  text: "12 Feb, 2020",
                                  textStyle: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                height: 20.h,
                              ),
                              const CustomText(
                                  text: "نوع الرحلة",
                                  textStyle: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const CustomText(
                                  text: "ذهاب وعودة",
                                  textStyle: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 15,
                                  )),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 120.w,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              const CustomText(
                                  text: "تاريخ الذهاب",
                                  textStyle: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const CustomText(
                                  text: "12 Feb, 2020",
                                  textStyle: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                height: 20.h,
                              ),
                              const CustomText(
                                  text: "نوع الحجز",
                                  textStyle: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const CustomText(
                                  text: "مؤكد",
                                  textStyle: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 15,
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              VerticalSpace(20.h),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 40.0),
                 child: MySeparator(color: ColorManager.white, height: 1,),
               ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  4,
                      (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: ColorManager.white,
                            ),
                          ),
                          title: Row(
                            children: const [
                              Text(
                                "\$ 1,200",
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: 18,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 100.0),
                                child: Text(
                                  "كبير",
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: const Text(
                            "المسافر(1)",
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            height: 1,
                            color: ColorManager.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),



              Padding(
                padding:  EdgeInsets.only(top: 10.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 45.0.w),
                      child: CustomText(text: "400\$",textStyle: TextStyle(
                        color: ColorManager.colorCodeFCBD5D,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp
                      ),),
                    ), SizedBox(
                      width: 140.w,
                    ),
                    CustomText(text: "المجموع الكلي",textStyle: TextStyle(
                        color: ColorManager.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp
                    ),)
                  ],
                ),
              )
            ],
          )
        ])),
      ),
      bottomNavigationBar: navbar.BottomNavigationBar(currentIndex: 1),
    );
  }
}
