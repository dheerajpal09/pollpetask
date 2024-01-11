import 'package:flutter/material.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/style_file.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class TextFormScreen extends StatelessWidget {
  final TextEditingController textEditingController;
//  final String hinttext;
  final String labeltext;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscure;
  final bool obscure1;
  final bool suffixIcon;
  final Widget? suffixIconWidget;
  final void Function()? onPressed;
  final TextInputType? keyboardType;

  const TextFormScreen({
    super.key,
    required this.textEditingController,
    // required this.hinttext,
    required this.icon,
    required this.labeltext,
    this.obscure = true,
    this.obscure1 = true,
    this.validator,
    this.readOnly = false,
    this.suffixIcon = false,
    this.suffixIconWidget,
    this.onPressed,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 7.h,
      child: TextFormField(
        controller: textEditingController,
        readOnly: readOnly,
        obscureText: suffixIcon ? obscure : false,
        // obscureText1: suffixIcon ? obscure : false,
        keyboardType: keyboardType ?? TextInputType.text,
        cursorColor: ColorResources.primaryColor,
        style: Style_File.detailstitle.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorResources.blackColor,
            fontSize: 16.sp),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: labeltext,
            labelStyle: TextStyle(fontSize: 15.sp, fontFamily: 'Poppins'),
            // hintText: hinttext,
            hintStyle: TextStyle(fontSize: 14.sp, fontFamily: 'Poppins'),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(2.w),
            )),
            prefixIcon: Icon(
              icon,
              size: 3.h,
              color: ColorResources.blackColor.withOpacity(0.6),
            ),
            suffixIcon: suffixIcon
                ? suffixIconWidget ??
                    IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                          //   obscure1 ? Icons.visibility_off : Icons.visibility,
                          color: ColorResources.blackColor,
                        ))
                : null),
        validator: validator,
      ),
    );
  }
}
