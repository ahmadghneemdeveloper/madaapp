import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/components.dart';

import '../../../../config/navigation/routes.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _WorkingBottomSheetState();
}

class _WorkingBottomSheetState extends State<FilterBottomSheet> {
  final int minQuantity = 1;
  final int maxQuantity = 10;
  int _selectedQuantity = 1;
   String _selectedValue='حجز مؤقت';
  @override
  void initState() {
    _selectedValue = 'حجز مؤقت';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 665.h,
      decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:  EdgeInsets.only(right:15.0.w,top: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                        text: 'حدد عدد المسافرين',
                        textStyle: TextStyle(
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp)),
                    CustomText(
                        text: 'فضلا قم بتحديد عدد المسافرين لكل فئة',
                        textStyle: TextStyle(
                            color: ColorManager.gray,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp)),
                    VerticalSpace(10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right:10.0.w,top: 10.h),
                          child: CustomText(
                            text: 'كبار',
                            textStyle: TextStyle(
                                color: ColorManager.gray,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp)),
                        ),
                        Container(
                          height: size.width / 8,
                          width: size.width / 0.22,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              right: size.width / 80,
                              left: size.width / 20),
                          decoration: BoxDecoration(
                            color: ColorManager.colorButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            readOnly: true,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: ColorManager.white),
                            decoration: InputDecoration(
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if(_selectedQuantity != 1 && minQuantity != 0 ){
                                          _selectedQuantity--;
                                        }else{}
                                      });
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 25.w,
                                      margin: EdgeInsets.only(left: 16.r,top: 5.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.r),
                                        color: ColorManager.white,
                                        border: Border.all(
                                          color: ColorManager.colorCode5E57BE,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(Icons.remove_rounded),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: CustomText(
                                      text: '$_selectedQuantity',
                                      textStyle: TextStyle(color: ColorManager.black,
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w600,),

                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if(_selectedQuantity == maxQuantity){
                                        }else{
                                          _selectedQuantity++;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 25.w,
                                      margin: EdgeInsets.only(right: 16.r,top: 5.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.r),
                                        color: ColorManager.white,
                                        border: Border.all(
                                          color: ColorManager.colorCode5E57BE,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(Icons.add_rounded),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 85.0.w),
                                    child: Row(

                                      children: [
                                        CustomText(
                                            text: 'أكبر من 12 سنة',
                                            textStyle: TextStyle(
                                                color: ColorManager.gray,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp)),
                                        Image.asset(
                                          AssetsManager.users,
                                          width: size.width / 12,
                                          height: size.width / 12,
                                        ),
                                      ],
                                    ),
                                  )

                                ],
                              ),
                              border: InputBorder.none,


                            ),
                          ),
                        ),
                      ],
                    ),
                    VerticalSpace(10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right:10.0.w,top: 10.h),
                          child: CustomText(
                              text: 'أطفال',
                              textStyle: TextStyle(
                                  color: ColorManager.gray,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp)),
                        ),
                        Container(
                          height: size.width / 8,
                          width: size.width / 0.22,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              right: size.width / 80,
                              left: size.width / 20),
                          decoration: BoxDecoration(
                            color: ColorManager.colorButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            readOnly: true,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: ColorManager.white),
                            decoration: InputDecoration(
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if(_selectedQuantity != 1 && minQuantity != 0 ){
                                          _selectedQuantity--;
                                        }else{}
                                      });
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 25.w,
                                      margin: EdgeInsets.only(left: 16.r,top: 5.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.r),
                                        color: ColorManager.white,
                                        border: Border.all(
                                          color: ColorManager.colorCode5E57BE,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(Icons.remove_rounded),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: CustomText(
                                      text: '$_selectedQuantity',
                                      textStyle: TextStyle(color: ColorManager.black,
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w600,),

                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if(_selectedQuantity == maxQuantity){
                                        }else{
                                          _selectedQuantity++;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 25.w,
                                      margin: EdgeInsets.only(right: 16.r,top: 5.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.r),
                                        color: ColorManager.white,
                                        border: Border.all(
                                          color: ColorManager.colorCode5E57BE,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(Icons.add_rounded),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 85.0.w),
                                    child: Row(
                                      children: [
                                        CustomText(
                                            text: 'من 2-12 سنة',
                                            textStyle: TextStyle(
                                                color: ColorManager.gray,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp)),
                                        Image.asset(
                                          AssetsManager.child,
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
                      ],
                    ),
                    VerticalSpace(10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right:10.0.w,top: 10.h),
                          child: CustomText(
                              text: 'رضيع',
                              textStyle: TextStyle(
                                  color: ColorManager.gray,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp)),
                        ),
                        Container(
                          height: size.width / 8,
                          width: size.width / 0.22,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              right: size.width / 80,
                              left: size.width / 20),
                          decoration: BoxDecoration(
                            color: ColorManager.colorButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            readOnly: true,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: ColorManager.white),
                            decoration: InputDecoration(
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if(_selectedQuantity != 1 && minQuantity != 0 ){
                                          _selectedQuantity--;
                                        }else{}
                                      });
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 25.w,
                                      margin: EdgeInsets.only(left: 16.r,top: 5.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.r),
                                        color: ColorManager.white,
                                        border: Border.all(
                                          color: ColorManager.colorCode5E57BE,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(Icons.remove_rounded),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: CustomText(
                                      text: '$_selectedQuantity',
                                      textStyle: TextStyle(color: ColorManager.black,
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w600,),

                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if(_selectedQuantity == maxQuantity){
                                        }else{
                                          _selectedQuantity++;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 25.w,
                                      margin: EdgeInsets.only(right: 16.r,top: 5.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.r),
                                        color: ColorManager.white,
                                        border: Border.all(
                                          color: ColorManager.colorCode5E57BE,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(Icons.add_rounded),
                                    ),
                                  ),

                                  Padding(
                                    padding:  EdgeInsets.only(left: 85.0.w),
                                    child: Row(
                                      children: [
                                        CustomText(
                                            text: 'أقل من سنتين',
                                            textStyle: TextStyle(
                                                color: ColorManager.gray,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp)),
                                        Image.asset(
                                          AssetsManager.infant,
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
                      ],
                    ),
                    VerticalSpace(10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right: 8.0.w),
                          child: CustomText(
                              text: 'حدد نوع الحجز',
                              textStyle: TextStyle(
                                  color: ColorManager.gray,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp)),
                        ),
                        Column(
                          children: [
                            // First radio button
                            RadioListTile(
                              title: CustomText(text: 'حجز مؤقت',textStyle: TextStyle(
                        color: ColorManager.black
                        )),
                              value: 'حجز مؤقت',
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value!;
                                });
                              },
                            ),

                            // Second radio button
                            RadioListTile(
                              title: CustomText(text: 'حجز مؤكد',textStyle: TextStyle(
                                color: ColorManager.black
                              )),
                              value: 'حجز مؤكد',
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value!;
                                });
                              },
                            ),

                          ],
                        )
                      ],
                    ),
                    VerticalSpace(10.h),
                    Button('التالي', 1.2, () {
                      HapticFeedback.lightImpact();

                      NavigationService.pushReplacement(context, Routes.travelerdata);
                    }, ColorManager.colorCode5E57BE),
                    VerticalSpace(30.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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
