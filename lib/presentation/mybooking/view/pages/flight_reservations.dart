import 'package:flutter/material.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/custom_assets_image.dart';
import 'package:madaapp/presentation/component/custom_text.dart';
import 'package:madaapp/core/resources/bottom_navigationBar.dart' as navbar;
import 'package:madaapp/presentation/mybooking/view/components/mybooking_card.dart';


class FlightReservations extends StatefulWidget {
  const FlightReservations({Key? key}) : super(key: key);

  @override
  State<FlightReservations> createState() => _FlightReservationsState();
}

class _FlightReservationsState extends State<FlightReservations> {
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
              height: 200.h,
              width: double.infinity,
              color:ColorManager.colorCode343434 ,
            ),
            Center(
              child: SizedBox(
                height: 200.h,
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
                  padding: EdgeInsets.only(left: 40.w),
                  child: const CustomAssetsImage(
                    image: AssetsManager.notfication,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: CustomText(
                      text: "حجوزات الطيران",
                      textStyle: TextStyle(
                          color: ColorManager.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 30.w,
                ),
                GestureDetector(
                  onTap: () {
                    NavigationService.goBack(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 40.w),
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
        MybookingCard()
      ])),
      bottomNavigationBar: navbar.BottomNavigationBar(currentIndex: 1),
    );
  }
}
