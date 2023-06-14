import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/%D9%8DsliderImportant_trips.dart';
import 'package:madaapp/presentation/component/components.dart';
import 'package:madaapp/presentation/component/slider.dart';

import 'package:madaapp/core/resources/bottom_navigationBar.dart' as navbar;
import 'package:madaapp/presentation/home/view/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../config/navigation/routes.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages>
    with SingleTickerProviderStateMixin {
  late final PageController pageController;
  var currentIndex = 2;

    @override
    void initState() {
      pageController = PageController();
      getDashboardData(context);
      // TODO: implement initState
      super.initState();
    }

    @override
    void dispose() {
      pageController.dispose();
      // TODO: implement dispose
      super.dispose();
    }
    getDashboardData(BuildContext context) {
      Provider.of<HomeViewModel>(context, listen: false).getHomeData(context: context);
    }

    @override
    Widget build(BuildContext context) {
      final viewModel = Provider.of<HomeViewModel>(context, listen: false);
      return Scaffold(
        body: SingleChildScrollView(
            child: FutureBuilder(
                future: viewModel.getHomeData(context: context),
                builder: (ctx, data) {
                  if (data.connectionState == ConnectionState.waiting ||
                      data.hasError) {
                    return Center(child: MyProgressIndicator());
                  } else {
                    return Consumer<HomeViewModel>(builder: (_, data, c) {
                      if (data.isLoading) {
                        return Center(child: MyProgressIndicator());
                      }else if (data.homeData == null) {
                        return const Center(
                            child: CustomText(
                          text: " Wrong ",
                        ));
                      } else {
                        return Column(
                          children: [
                            Stack(children: [
                              SizedBox(
                                height: 400.h,
                                width: 400.w,
                                child: const CustomAssetsImage(
                                    image: AssetsManager.appBar,
                                    boxFit: BoxFit.cover),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 60),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: const CustomAssetsImage(
                                              image: AssetsManager.notfication),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            NavigationService.push(
                                                context, Routes.booking);
                                          },
                                          child: const CustomAssetsImage(
                                            image: AssetsManager.search,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 130.w,
                                        ),
                                        CustomSvgImage(
                                          image: AssetsManager.appIcon,
                                          boxFit: BoxFit.cover,
                                          width: 40.w,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 150.w,
                                        ),
                                        const CustomText(
                                            text: "مرحبا, {}",
                                            textStyle: TextStyle(
                                                color:
                                                    ColorManager.colorCodeFCBD5D,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            NavigationService.push(
                                                context, Routes.profileScreen);
                                          },
                                          child: CustomAssetsImage(
                                            image: AssetsManager.profile,
                                            boxFit: BoxFit.cover,
                                            width: 40.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 60.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            CustomAssetsImage(
                                              image: AssetsManager.cars,
                                              boxFit: BoxFit.cover,
                                              width: 50.w,
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            const CustomText(
                                                text: "سيارات",
                                                textStyle: TextStyle(
                                                    color: ColorManager
                                                        .colorCodeFCBD5D,
                                                    fontWeight: FontWeight.bold))
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          children: [
                                            CustomAssetsImage(
                                              image: AssetsManager.airplane,
                                              boxFit: BoxFit.cover,
                                              width: 50.w,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            const CustomText(
                                                text: "طيران",
                                                textStyle: TextStyle(
                                                    color: ColorManager
                                                        .colorCodeFCBD5D,
                                                    fontWeight: FontWeight.bold))
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          children: [
                                            CustomAssetsImage(
                                              image: AssetsManager.apartments,
                                              boxFit: BoxFit.cover,
                                              width: 50.w,
                                            ),
                                            const CustomText(
                                                text: "شقق",
                                                textStyle: TextStyle(
                                                    color: ColorManager
                                                        .colorCodeFCBD5D,
                                                    fontWeight: FontWeight.bold))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ]),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0.w),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: CustomText(
                                  text: "أهم الرحلات",
                                  textStyle: TextStyle(
                                      color: ColorManager.colorCode0F181F,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                ),
                              ),
                            ),

                            /// slider important
                            SliderImportant(),

                            SizedBox(
                              height: 20.h,
                            ),
                            //الوجهات الأكثر شيوعا
                            Padding(
                              padding: EdgeInsets.only(right: 8.0.w),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: CustomText(
                                  text: "الوجهات الأكثر شيوعا",
                                  textStyle: TextStyle(
                                      color: ColorManager.colorCode0F181F,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                ),
                              ),
                            ),

                            /// Sliders Popular
                            const SliderPopular(),

                            //navbar.BottomNavigationBar(currentIndex: 2),
                          ],
                        );
                      }
                    });
                  }
                })),
      bottomNavigationBar: navbar.BottomNavigationBar(currentIndex: 2),
    );
  }
}
