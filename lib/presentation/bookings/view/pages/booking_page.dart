import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/components.dart';
import 'package:madaapp/core/resources/bottom_navigationBar.dart' as navbar;

import '../../../../config/navigation/routes.dart';

class BookingPages extends StatefulWidget {
  const BookingPages({super.key});

  @override
  _BookingPagesState createState() => _BookingPagesState();
}

class _BookingPagesState extends State<BookingPages>
    with SingleTickerProviderStateMixin {
  late final PageController pageController;
  var currentIndex = 1;
  bool vertical = false;

  @override
  void initState() {
    pageController = PageController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  int _selectedButton = 0;
  int _selectedDgree = 0;

  @override
  Widget build(BuildContext context) {
    //  final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
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
                      image: AssetsManager.backtrivel, boxFit: BoxFit.fitWidth),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 50.0, left: 20.w),
                    child: const CustomAssetsImage(
                      image: AssetsManager.notfication,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 58.0),
                    child: Column(
                      children: [
                        CustomAssetsImage(
                          image: AssetsManager.bookingicon,
                          width: 200.w,
                        ),
                        CustomText(
                          text: "تذاكر الطيران",
                          textStyle: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      NavigationService.goBack(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 50.0, right: 20.w),
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

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Container(
                    height: 350.h,
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
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedButton = 1;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: _selectedButton == 1
                                        ? ColorManager.colorCodeFCBD5D
                                        : ColorManager.colorCode5E57BE,
                                    onPrimary: ColorManager.white,
                                    side: const BorderSide(
                                        color: ColorManager.white, width: 1.0),
                                  ),
                                  child: const Text('ذهاب وعودة'),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedButton = 2;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: _selectedButton == 2
                                        ? ColorManager.colorCodeFCBD5D
                                        : ColorManager.colorCode5E57BE,
                                    onPrimary: ColorManager.white,
                                    side: const BorderSide(
                                        color: ColorManager.white, width: 1.0),
                                  ),
                                  child: const Text('ذهاب فقط'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 180.0.w, top: 15.h),
                                      child: CustomText(
                                        text: "مدينة المغادرة",
                                        textStyle: TextStyle(
                                            color: ColorManager.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                      ),
                                    ),
                                    Container(
                                      height: size.width / 8,
                                      width: size.width / 1.22,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          right: size.width / 20,
                                          left: size.width / 50),
                                      decoration: BoxDecoration(
                                        color: ColorManager.colorButton,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextField(
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                            color: ColorManager.white),
                                        decoration: InputDecoration(
                                          suffixIcon: Image.asset(
                                            AssetsManager.take_on,
                                            width: size.width / 12,
                                            height: size.width / 12,
                                          ),
                                          border: InputBorder.none,
                                          hintMaxLines: 1,
                                          hintText: 'عدن',
                                          hintStyle: const TextStyle(
                                            fontSize: 15,
                                            color: ColorManager.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 180.0.w, top: 15.h),
                                      child: CustomText(
                                        text: "مدينة الوصول",
                                        textStyle: TextStyle(
                                            color: ColorManager.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                      ),
                                    ),
                                    Container(
                                      height: size.width / 8,
                                      width: size.width / 1.22,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          left: size.width / 50,
                                          right: size.width / 20),
                                      decoration: BoxDecoration(
                                        color: ColorManager.colorButton,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextField(
                                        style: const TextStyle(
                                            color: ColorManager.white),
                                        textAlign: TextAlign.right,
                                        decoration: InputDecoration(
                                          suffixIcon: Image.asset(
                                            AssetsManager.take_off,
                                            width: size.width / 12,
                                            height: size.width / 12,
                                          ),
                                          border: InputBorder.none,
                                          hintMaxLines: 1,
                                          hintText: 'القاهرة',
                                          hintStyle: const TextStyle(
                                            fontSize: 15,
                                            color: ColorManager.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 25.0.h),
                                  child: SizedBox(
                                    height: 150.h,
                                    width: 24.w,
                                    child: const CustomAssetsImage(
                                      image: AssetsManager.arrow,
                                      boxFit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                        ///image arrow
                      ],
                    ),
                  ),
                ),
                VerticalSpace(10.h),
                Column(
                  children: [
                    //تاريخ المغادرة
                    const Align(
                        alignment: Alignment.topRight,
                        child: CustomText(
                          text: 'تاريخ المغادرة',
                          textStyle:
                              TextStyle(color: ColorManager.colorCode343434),
                        )),

                    Stack(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              AssetsManager.celenderdate,
                              width: 500.w,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 40.0.w, top: 15.h),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const CustomText(
                                          text: '12 Fab, 2020',
                                          textStyle: TextStyle(
                                              color: ColorManager.color707070)),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Image.asset(AssetsManager.date)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 40.0.w, top: 60.h),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const CustomText(
                                          text: '12 Fab, 2020',
                                          textStyle: TextStyle(
                                              color: ColorManager.color707070)),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Image.asset(AssetsManager.date)
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Center(
                          child: Row(
                            children: [
                              TapEffect(
                                onClick: () {
                                  NavigationService.push(context, Routes.datepage);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 32.0.w, vertical: 50.h),
                                  child: Image.asset(
                                    AssetsManager.calendaricon,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150.w,
                              ),
                              const CustomText(
                                text: 'تاريخ المغادرة',
                                textStyle: TextStyle(
                                    color: ColorManager.colorCode343434),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    // حدد الدرجة
                    const Align(
                        alignment: Alignment.topRight,
                        child: CustomText(
                          text: 'حدد الدرجة',
                          textStyle:
                              TextStyle(color: ColorManager.colorCode343434),
                        )),

                    Row(
                      children: [

                        // all
                        ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedDgree = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: _selectedDgree == 1
                              ? ColorManager.colorCode5E57BE
                              : ColorManager.white,
                          onPrimary: ColorManager.white,
                          side: const BorderSide(
                              color: ColorManager.white, width: 1.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0.h),
                              child:
                              Image.asset(AssetsManager.Passenger_chair),
                            ),
                            SizedBox(
                                height: 88.h,
                                width: 70.w,
                                child: Center(
                                  child: Text('الكل',
                                      style: TextStyle(
                                          color: _selectedDgree == 1
                                              ? ColorManager.white
                                              : ColorManager.colorCode5E57BE,
                                          fontSize: 15.sp)),
                                )),
                          ],
                        ),
                      ),
                        // ecominc
                        SizedBox(width: 10.w,),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedDgree = 2;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: _selectedDgree == 2
                                ? ColorManager.colorCode5E57BE
                                : ColorManager.white,
                            onPrimary: ColorManager.white,
                            side: const BorderSide(
                                color: ColorManager.white, width: 1.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.0.h),
                                child:
                                    Image.asset(AssetsManager.Passenger_chair),
                              ),
                              SizedBox(
                                  height: 88.h,
                                  width: 70.w,
                                  child: Center(
                                    child: Text('درجة السياحة',
                                        style: TextStyle(
                                            color: _selectedDgree == 2
                                                ? ColorManager.white
                                                : ColorManager.colorCode5E57BE,
                                            fontSize: 15.sp)),
                                  )),
                            ],
                          ),
                        ),

                        // VIP
                        SizedBox(width: 10.w,),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedDgree = 3;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: _selectedDgree == 3
                                ? ColorManager.colorCode5E57BE
                                : ColorManager.white,
                            onPrimary: ColorManager.white,
                            side: const BorderSide(
                                color: ColorManager.white, width: 1.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.0.h),
                                child: Image.asset(AssetsManager.office_chair),
                              ),
                              SizedBox(
                                  height: 88.h,
                                  width: 70.w,
                                  child: Center(
                                    child: Text(
                                      'درجة رجال الأعمال',
                                      style: TextStyle(
                                          color: _selectedDgree == 3
                                              ? ColorManager.white
                                              : ColorManager.colorCode5E57BE,
                                          fontSize: 15.sp),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                VerticalSpace(30.h),
                Button('التالي', 1.2, () {
                  HapticFeedback.lightImpact();

                  NavigationService.pushReplacement(context, Routes.pricingdetails);
                }, ColorManager.colorCode5E57BE),
                VerticalSpace(20.h),
              ],
            ),
          )
        ]),
      )),
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
