import 'package:flutter/material.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/style_file.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SocialButtonWidget extends StatefulWidget {
  final String? image;
  final String? text;
  final Color? boxcolor;
  final Color? textcolor;

  final Function()? onTap;
  const SocialButtonWidget({
    super.key,
    this.image,
    this.text,
    this.onTap,
    this.boxcolor,
    this.textcolor,
  });

  @override
  State<SocialButtonWidget> createState() => _SocialButtonWidgetState();
}

class _SocialButtonWidgetState extends State<SocialButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 7.h,
        decoration: BoxDecoration(
            color: widget.boxcolor ?? ColorResources.grayColor.withOpacity(0.2),
            border: Border.all(
              color: ColorResources.grayColor,
            ),
            borderRadius: BorderRadius.circular(2.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              widget.image!,
              height: 5.h,
              width: 20.w,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              widget.text ?? ''.toUpperCase(),
              style: Style_File.onboardtitle.copyWith(
                  color: widget.textcolor ?? Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
