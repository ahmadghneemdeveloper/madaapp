import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/Listnavigation.dart';
import 'package:madaapp/core/resources/app_colors.dart';

import '../../config/navigation/routes.dart';

class BottomNavigationBar extends StatefulWidget {
   BottomNavigationBar({Key? key,required this.currentIndex}) : super(key: key);
  var currentIndex = 0;
  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {

  ListNavigation listNavigation=ListNavigation();
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(

      margin: EdgeInsets.all(displayWidth * .05),
      height: displayWidth * .155,
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
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: displayWidth * .12),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              widget.currentIndex = index;
              HapticFeedback.lightImpact();
            });
            if (index == 0) {
              NavigationService.pushReplacement(context, Routes.profileScreen);
            } else if (index == 1) {
              NavigationService.pushReplacement(
                  context, Routes.mybooking);
            } else {
              NavigationService.pushReplacement(
                  context, Routes.homeScreen);
            }
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == widget.currentIndex
                    ? displayWidth * .32
                    : displayWidth * .18,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: index == widget.currentIndex ? displayWidth * .12 : 0,
                  width: index == widget.currentIndex ? displayWidth * .32 : 0,
                  decoration: BoxDecoration(
                    color: index == widget.currentIndex
                        ? Colors.blueAccent.withOpacity(.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == widget.currentIndex
                    ? displayWidth * .31
                    : displayWidth * .18,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == widget.currentIndex
                              ? displayWidth * .13
                              : 0,
                        ),
                        AnimatedOpacity(
                          opacity: index == widget.currentIndex ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            index == widget.currentIndex
                                ? listNavigation.listOfStrings[index]
                                : '',
                            style: const TextStyle(
                              color: ColorManager.colorCode5E57BE,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == widget.currentIndex
                              ? displayWidth * .03
                              : 20,
                        ),
                        Icon(
                          listNavigation.listOfIcons[index],
                          size: displayWidth * .076,
                          color: index == widget.currentIndex
                              ? ColorManager.colorCode5E57BE
                              : Colors.black26,
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
    );
  }
}
