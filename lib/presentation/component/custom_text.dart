import 'package:flutter/material.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import '../../../main.dart';
import '../../core/resources/resources.dart';


/*String translate(String word) {
  return word.tr();
}*/

Widget customText(
    {Key? key,
    String? text,
    Color? color,
    double? fontSize,
    double? height,
    bool underline = false,
    double? letterSpacing,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    int? maxLines}) {
  return Text(
    text!,
    textAlign: textAlign,
    style: TextStyle(
        decoration: underline ? TextDecoration.underline : null,
        letterSpacing: letterSpacing,
        height: height,
        color: color ?? ColorManager.colorCode0F181F,
        fontSize: fontSize?.sp ?? 14.sp,
        fontWeight: fontWeight ?? FontWeightManager.medium,
        fontFamily:/* appContext?.locale.languageCode == "ar"
            ? FontConstants.cairoFontFamily
            :*/ FontConstants.fontFamily,),
    overflow: overflow,
    maxLines: maxLines,
  );
}

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      this.textStyle,
      required this.text,

      this.textAlign,
      this.overflow,
      this.maxLines})
      : super(key: key);
  final String? text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? textStyle;


  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: textStyle ?? Theme.of(context).textTheme.titleSmall,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
