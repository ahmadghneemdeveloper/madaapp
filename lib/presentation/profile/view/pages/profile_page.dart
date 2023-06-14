import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/resources/font_manager.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/custom_svg_image.dart';
import 'package:madaapp/presentation/component/custom_text.dart';
import 'package:madaapp/presentation/component/custom_text_field.dart';
import 'package:madaapp/presentation/component/indicator.dart';
import 'package:madaapp/presentation/component/spaces.dart';
import 'package:madaapp/core/resources/bottom_navigationBar.dart' as navbar;
import 'package:madaapp/presentation/profile/view/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../config/navigation/routes.dart';

class ProfilePages extends StatefulWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  var currentIndex = 0;

  @override
  void initState() {

    final viewModel = Provider.of<ProfileViewModel>(context, listen: false)
            .getProfileData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final viewModel = Provider.of<ProfileViewModel>(context, listen: false);
    return Scaffold(
        backgroundColor: ColorManager.colorCode343434,
        body: SafeArea(
            child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationService.push(context, Routes.settings);
                  },
                  child: Container(
                    height: 30,
                    width: 40,
                    child: const Icon(
                      Icons.settings,
                      color: ColorManager.white,
                    ),
                  ),
                ),
                const Spacer(),
                CustomSvgImage(image: AssetsManager.appIcon, height: 50.h),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    NavigationService.pushReplacement(
                        context, Routes.homeScreen);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: ColorManager.white,
                )
              ],
            ),
          ),
          VerticalSpace(20.h),



          Expanded(
    child: Consumer<ProfileViewModel>(builder: (_, myData, ch) {
      if (myData.isLoading) {
        return Center(child: MyProgressIndicator());
      } else if (myData.profileData == null) {
        return const Center(
            child: CustomText(
              text: "SomeThing Went Wrong ",
            ));
      } else {

return
  Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    decoration: BoxDecoration(
      color: ColorManager.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50.r),
        topRight: Radius.circular(50.r),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpace(20.h),
        Center(
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 30,
                      offset: const Offset(10, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(AssetsManager.airlogo),
                  radius: 70,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 40,
                  child: const Icon(
                    Icons.camera_alt,
                    color: ColorManager.colorCode343434,
                  ),
                ),
              ),
            ],
          ),
        ),
        VerticalSpace(10.h),
        Center(
            child: CustomText(
              text: myData.profileData?.data?.name ?? "",
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeightManager.semiBold),
            )),
        VerticalSpace(20.h),
        CustomText(
          text: "userName",
          textStyle: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeightManager.semiBold),
        ),
        const CustomTextField(
          readOnly: true,
          hintText: "سمية عبد الحق",
        ),
        VerticalSpace(20.h),
        CustomText(
          text: "Phone",
          textStyle: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeightManager.semiBold),
        ),
        const CustomTextField(
          readOnly: true,
          hintText: "+967554433221",
        ),
        VerticalSpace(20.h),
        CustomText(
          text: " providerName",
          textStyle: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeightManager.semiBold),
        ),
        const CustomTextField(
          readOnly: true,
          hintText: "providerName",
        ),
        VerticalSpace(180.h),
        navbar.BottomNavigationBar(currentIndex: 0),
      ],
    ),
  );
      }
    }) ),

        ])),
       // bottomNavigationBar:  navbar.BottomNavigationBar(currentIndex: 0,)
    );
  }


}

