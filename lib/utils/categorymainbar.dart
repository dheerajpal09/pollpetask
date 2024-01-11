import 'package:flutter/material.dart';
import 'package:pollpetask/page_routes/routes.dart';
import 'package:pollpetask/utils/buttonWidget.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/style_file.dart';
import 'package:pollpetask/utils/titletextstyle.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryMainBar extends StatelessWidget {
  final String? image;
  final String? text;
  final String? subtext;
  const CategoryMainBar({super.key, this.image, this.text, this.subtext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorResources.secondryColor),
      child: Padding(
        padding: EdgeInsets.all(3.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextStyle(
                  text: text!,
                  style: Style_File.texttitlemain
                      .copyWith(color: ColorResources.blackColor),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TitleTextStyle(
                  text: subtext!,
                  style: Style_File.subtitle
                      .copyWith(color: ColorResources.blackColor),
                ),
              ],
            ),
            ButtonWidget(
              onTap: () {
                Navigator.pushNamed(context, Routes.homeDashboardScreen);
              },
              text: "    Skip    ",
              textcolor: ColorResources.primaryColor,
              boxcolor: ColorResources.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
