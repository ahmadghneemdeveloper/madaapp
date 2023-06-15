import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(PhoneNumber)? onChanged;
   InputField({Key? key,required this.controller, this.onChanged,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.22,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntlPhoneField(
        keyboardType:  TextInputType.phone ,
        controller: controller,
        flagsButtonPadding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: InputDecoration(

          border: InputBorder.none,
          hintText: "Phone Number",
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(.5),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.2),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.5),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textInputAction: TextInputAction.next,
        initialCountryCode: 'YE',
        onChanged:onChanged,
        style: TextStyle(color: Colors.black.withOpacity(.8)),
      ),
    );
  }
}

