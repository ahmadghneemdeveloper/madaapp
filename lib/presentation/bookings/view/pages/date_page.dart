import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/components.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../config/navigation/routes.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    //  pageController = PageController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
      } else if (args.value is DateTime) {
      } else if (args.value is List<DateTime>) {
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.colorCode343434,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
            //appBar
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: 200.h,
                    width: 350.w,
                    child: const CustomAssetsImage(
                        image: AssetsManager.backtrivel,
                        boxFit: BoxFit.fitWidth),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomAssetsImage(
                        image: AssetsManager.notfication,
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100.0.h),
                        child: CustomText(
                          text: "حدد تاريخ رحلتك",
                          textStyle: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
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
              ],
            ),

            //body
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0.w,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 320.h,
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
                  SfDateRangePicker(
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(
                        DateTime.now().subtract(const Duration(days: 4)),
                        DateTime.now().add(const Duration(days: 3))),
                    endRangeSelectionColor: ColorManager.colorCodeFCBD5D,
                    startRangeSelectionColor: ColorManager.colorCodeFCBD5D,
                    rangeSelectionColor: ColorManager.gray,
                  ),
                ],
              ),
            ),
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
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 25.0.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  AssetsManager.datePicker,
                                ),
                                CustomText(
                                  text: 'تاريخ العودة',
                                  textStyle: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 15.sp),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 100.w,
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  AssetsManager.datePicker,
                                ),
                                CustomText(
                                  text: 'تاريخ الذهاب',
                                  textStyle: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 15.sp),
                                )
                              ],
                            ),
                          ],
                        ),
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
                              CustomText(
                                text: 'ثلاثاء',
                                textStyle: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 120.w,
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
                                text: 'أربعاء',
                                textStyle: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            VerticalSpace(10.h),
            Button('تأكيد', 1.2, () {
              HapticFeedback.lightImpact();
              NavigationService.pushReplacement(context, Routes.wittingpage);
            }, ColorManager.colorCodeFCBD5D),
            VerticalSpace(40.h),
          ])),
        ));
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
              child: Icon(
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
