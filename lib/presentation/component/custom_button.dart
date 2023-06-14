import 'package:flutter/material.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/custom_text.dart';
import 'package:madaapp/presentation/component/indicator.dart';
import 'package:madaapp/presentation/component/tap_effect.dart';
import '../../core/resources/resources.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double paddingV = 6;
  final double paddingH = 6;
  final double marginV = 6;
  final double marginH = 6;
  final bool withBorder;

  final bool loading;
  final TextStyle? textStyle;

  final bool fullWidth = false;
  final bool shadow = false;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final BorderRadius? radius;

  final VoidCallback? onTap;

  const CustomButton(
      {Key? key,
      this.buttonText,
      this.width,
      this.withBorder = false,
      this.height,
      this.radius,
      this.textStyle,
      this.borderColor,
      this.padding,
      this.margin,
      this.loading = false,
      this.backgroundColor,
      this.textColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      isClickable: !loading,
      onClick: loading ? null : onTap,
      child: Container(
        height: height ?? 50.h,
        width: width,
        // padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        decoration: BoxDecoration(
          border: withBorder
              ? Border.all(
                  color: borderColor ??
                      backgroundColor ??
                      Theme.of(context).primaryColor)
              : null,
          boxShadow: const [
            BoxShadow(
                color: ColorManager.greyColorD6D6D6,
                spreadRadius: 1,
                blurRadius: 5), // changes position of shadow
          ],
          color: backgroundColor ?? ColorManager.primaryColor,
          // gradient: backgroundColor == null ? getMainColorGradient() : null,
          borderRadius: radius ??
              BorderRadius.all(
                Radius.circular(14.r),
              ),
        ),
        child: Center(
            child: loading
                ? MyProgressIndicator()
                : CustomText(
                    textStyle: textStyle ??
                        Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: textColor ?? Colors.white,
                              fontSize: FontSize.s17.sp,
                              fontWeight: FontWeightManager.medium,
                            ),
                    text: buttonText ?? "",
                  )),
      ),
    );
  }
}
