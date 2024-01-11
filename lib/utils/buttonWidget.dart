import 'package:flutter/material.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/style_file.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidget extends StatefulWidget {
  final String? image;
  final String? text;
  final Color? boxcolor;
  final Color? textcolor;

  final Function()? onTap;
  const ButtonWidget({
    super.key,
    this.image,
    this.text,
    this.onTap,
    this.boxcolor,
    this.textcolor,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 6.h,
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     ColorResources.primaryColor,
            //     ColorResources.primaryLight,
            //   ],
            // ),
            color: widget.boxcolor ?? ColorResources.primaryColor,
            // border: Border.all(
            //  color: ColorResources.primaryColor,

            //  ),
            borderRadius: BorderRadius.circular(2.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text ?? ''.toUpperCase(),
              style: Style_File.onboardtitle.copyWith(
                  color: widget.textcolor ?? Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
