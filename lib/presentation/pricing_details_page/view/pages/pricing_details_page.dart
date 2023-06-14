import 'package:flutter/material.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/MySeparator.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/custom_assets_image.dart';
import 'package:madaapp/presentation/component/custom_text.dart';
import 'package:madaapp/presentation/component/spaces.dart';

class PricingDetails extends StatefulWidget {
  const PricingDetails({Key? key}) : super(key: key);

  @override
  State<PricingDetails> createState() => _PricingDetailsState();
}

class _PricingDetailsState extends State<PricingDetails> {
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
                                text: "   من\nعدن",
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
                                text: " إلى\nالرياض",
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

          Stack(
            children: [
              const Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: CustomAssetsImage(
                      image: AssetsManager.eticket_card, boxFit: BoxFit.cover),
                ),
              ),
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
                                color: ColorManager.colorCodeFCBD5D,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CustomText(
                                text: 'درجة رجال الأعمال',
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorManager.colorCodeFCBD5D),
                              ),
                            )),
                        SizedBox(
                          width: 130.w,
                        ),
                        const CustomText(
                          text: 'مسافرين${4}',
                          textStyle: TextStyle(
                              fontSize: 14,
                              color: ColorManager.colorCode5E57BE,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(20.h),
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
                                      color: ColorManager.gray,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const CustomText(
                                  text: "12 Feb, 2020",
                                  textStyle: TextStyle(
                                    color: ColorManager.colorCode343434,
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                height: 20.h,
                              ),
                              const CustomText(
                                  text: "نوع الرحلة",
                                  textStyle: TextStyle(
                                      color: ColorManager.gray,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const CustomText(
                                  text: "ذهاب وعودة",
                                  textStyle: TextStyle(
                                    color: ColorManager.colorCode343434,
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
                                      color: ColorManager.gray,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const CustomText(
                                  text: "12 Feb, 2020",
                                  textStyle: TextStyle(
                                    color: ColorManager.colorCode343434,
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                height: 20.h,
                              ),
                              const CustomText(
                                  text: "نوع الحجز",
                                  textStyle: TextStyle(
                                      color: ColorManager.gray,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const CustomText(
                                  text: "مؤكد",
                                  textStyle: TextStyle(
                                    color: ColorManager.colorCode343434,
                                    fontSize: 15,
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  VerticalSpace(20.h),

                  //line

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: MySeparator(
                      color: ColorManager.gray,
                      height: 1,
                    ),
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
                              title: Row(
                                children: const [
                                  Text(
                                    "\$ 1,200",
                                    style: TextStyle(
                                      color: ColorManager.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 100.0),
                                    child: Text(
                                      "كبير",
                                      style: TextStyle(
                                        color: ColorManager.gray,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: const Text(
                                "المسافر(1)",
                                style: TextStyle(
                                  color: ColorManager.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Divider(
                                height: 1,
                                color: ColorManager.gray,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 45.0.w),
                  child: CustomText(
                    text: "400\$",
                    textStyle: TextStyle(
                        color: ColorManager.colorCodeFCBD5D,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  width: 140.w,
                ),
                CustomText(
                  text: "المجموع الكلي",
                  textStyle: TextStyle(
                      color: ColorManager.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                )
              ],
            ),
          ),
          VerticalSpace(10.h),
          SizedBox(
            height: 200.h,
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  left: 30,
                  right: 30,
                  child: Card(
                    color: ColorManager.colorB3B4E264,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 20,
                  right: 20,
                  child: Card(
                    color: ColorManager.colorB3B4E2,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ),

                Positioned(
                  top: 10,
                  left: 10,
                  // right: 10,
                  child: Card(
                    color: ColorManager.colorF1F1F8,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                    child: Container(
                      height: 100.h,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                //_selectedButton = 2;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: ColorManager.colorF1F1F8,

                              side: const BorderSide(
                                  color: ColorManager.colorCode343434,
                                  width: 1.0),
                            ),
                            child: CustomText(
                              text: 'ادخل رقم السند',
                              textStyle: TextStyle(
                                  color: ColorManager.colorCode343434,
                                  fontSize: 15.sp),
                            ),
                          ),

                          SizedBox(width: 2.w,),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                //   _selectedButton = 2;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: ColorManager.colorF1F1F8,
                              side: const BorderSide(
                                  color: ColorManager.colorCode343434,
                                  width: 1.0),
                            ),

                            child:CustomText(
                              text: 'ادفع عبر الكاش',
                              textStyle: TextStyle(
                                  color: ColorManager.colorCode343434,
                                  fontSize: 15.sp),
                            ),
                          ),
                          SizedBox(width: 2.w,),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                //  _selectedButton = 2;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: ColorManager.colorF1F1F8,
                               side: const BorderSide(
                                  color: ColorManager.colorCode343434,
                                  width: 1.0),
                            ),
                            child: CustomText(
                              text: 'ادفع عبر الحاسب',
                              textStyle: TextStyle(
                                color: ColorManager.colorCode343434,
                              fontSize: 15.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Add more Card widgets here
              ],
            ),
          )
        ])),
      ),
    );
  }
}
