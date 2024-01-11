import 'package:flutter/material.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/imageResources.dart';
import 'package:pollpetask/utils/style_file.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class BlankScreensWidget extends StatelessWidget {
  double? height;
  final String? image;
  final String? title;
  final String? subtitle;
  final IconData? icon2;
  Color? backgroundColor;
  final Color? color1;
  final Color? color2;

  BlankScreensWidget({
    super.key,
    this.height,
    this.image,
    this.title,
    this.subtitle,
    this.icon2,
    this.color1,
    this.color2,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 60.h,
        width: 100.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image ?? ImageResources.blankimage,
                fit: BoxFit.cover,
                height: 22.h,
                color: backgroundColor,
              ),
              Text(
                title ?? "Cheers!",
                style: Style_File.onboardtitle
                    .copyWith(fontSize: 20.sp, color: Colors.black),
              ),
              Text(
                subtitle ?? "Your account has been created successfully",
                style: Style_File.subtitle
                    .copyWith(color: ColorResources.grayColor, fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
