import 'package:flutter/material.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/imageResources.dart';
import 'package:pollpetask/utils/style_file.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarScreens extends StatelessWidget {
  final String? image;
  final String? text;
  final IconData? icon2;
  final Color? backgroundColor;
  final Color? color1;
  final Color? color2;
  final Function()? onTap;
  const AppBarScreens({
    super.key,
    this.image,
    this.text,
    this.icon2,
    this.color1,
    this.color2,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageResources.appBarBackground),
                fit: BoxFit.cover)),
      ),
      iconTheme: IconThemeData(
        color: color1 ?? ColorResources.blackColor,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor ?? ColorResources.whiteColor,
      title: Text(
        text ?? '',
        style: Style_File.onboardtitle.copyWith(fontSize: 18.sp),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: onTap,
              icon: Icon(icon2),
              color: color2 ?? ColorResources.blackColor,
            ),
          ],
        ),
      ],
    );
  }
}
