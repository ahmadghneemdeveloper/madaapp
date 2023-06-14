import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';


import '../../core/resources/resources.dart';
import '../../core/resources/styles_manager.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PhoneValidator on String {
  bool isValidPhone() {
    return RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLine;
  final int? minLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String? validatorMessage;
  final Color? fillColor;
  final Widget? prefixIcon;
  final bool isPassword;
  final double contentVerticalPadding;
  final bool enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final FontWeight? hintWeight;
  final TextCapitalization? capitalization;
  final void Function()? onTap;
  final void Function(String? x)? onChange;
  final String? Function(String?)? validate;

  const CustomTextField(
      {this.controller,
      this.hintText,
      this.onTap,
      this.enabled = true,
      this.textInputType,
      this.hintWeight = FontWeightManager.light,
      this.maxLine,
      this.maxLength,
      this.minLines,
      this.focusNode,
      this.contentVerticalPadding = 0.0,
      this.nextNode,
      this.readOnly = false,
      this.prefixIcon,
      this.isPassword = false,
      this.suffixIcon,
      this.onChange,
      this.textInputAction,
      this.isPhoneNumber = false,
      this.isValidator = false,
      this.validatorMessage,
      this.capitalization = TextCapitalization.none,
      this.fillColor,
      this.validate,
      Key? key})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      textAlignVertical: TextAlignVertical.center,
      controller: widget.controller,
      maxLines: widget.maxLine ?? 1,
      minLines: widget.minLines,
      keyboardType: widget.textInputType ?? TextInputType.text,
      maxLength: widget.isPhoneNumber ? 11 : widget.maxLength,
      focusNode: widget.focusNode,
      initialValue: null,
      obscureText: widget.isPassword ? _obscureText : false,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(widget.nextNode);
      },
      onChanged: widget.onChange,
      //for initially validate
      //autovalidateMode: AutovalidateMode.always,
      inputFormatters: [
        widget.isPhoneNumber
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter
      ],
      validator: widget.validate,
      style: textFieldTextStyle(),
      decoration: InputDecoration(
        isDense: true,
        // important line
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 25.w),
        hintText: widget.hintText ?? '',
        filled: true,
        fillColor: widget.fillColor ?? ColorManager.white,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: _obscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onPressed: _toggle)
            : widget.suffixIcon,
        // contentPadding: EdgeInsets.symmetric(horizontal: 25.w,vertical: widget.contentVerticalPadding),
        // isDense: true,
        suffixIconConstraints: const BoxConstraints(minHeight: 0, minWidth: 0),
        counterText: '',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeightManager.light),
        //textFieldTextStyle(fontWeight: widget.hintWeight ),
        floatingLabelStyle: textFieldTextStyle(),
        counterStyle: textFieldTextStyle(),
        helperStyle: textFieldTextStyle(),
        labelStyle: textFieldTextStyle(),
        errorStyle: const TextStyle(height: 1.5),
        border: InputBorder.none,
      ),
    );
  }
}
