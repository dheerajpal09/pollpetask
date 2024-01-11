import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pollpetask/utils/imageResources.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class MainBar extends StatefulWidget {
  final String? image;
  final String? text;
  final String? subtext;
  const MainBar({super.key, this.image, this.text, this.subtext});

  @override
  State<MainBar> createState() => _MainBarState();
}

class _MainBarState extends State<MainBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 2.h,
        ),
        Stack(
          children: [
            Image.asset(
              ImageResources.login,
              height: 40.h,
              width: 100.w,
            ),
            Padding(
              padding: EdgeInsets.all(2.h),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                ),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
