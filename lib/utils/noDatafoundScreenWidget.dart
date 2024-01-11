import 'package:flutter/material.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/imageResources.dart';
import 'package:pollpetask/utils/style_file.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class NoDataFoundErrorScreens extends StatelessWidget {
  double? height;
  final String? image;
  final String? title;
  final IconData? icon2;
  Color? backgroundColor;
  final Color? color1;
  final Color? color2;

  NoDataFoundErrorScreens({
    super.key,
    this.height,
    this.image,
    this.title,
    this.icon2,
    this.color1,
    this.color2,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 75.h,
        width: 100.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image ?? ImageResources.notdatafound,
                fit: BoxFit.fill,
                height: 20.h,
                color: backgroundColor,
              ),
              Text(
                title ?? "Data Not Found!",
                style: Style_File.onboardbody
                    .copyWith(color: ColorResources.grayColor, fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
