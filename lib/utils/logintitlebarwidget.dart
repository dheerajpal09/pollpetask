import 'package:flutter/cupertino.dart';
import 'package:pollpetask/utils/style_file.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class LoginTitleMainBar extends StatelessWidget {
  final String? image;
  final String? text;
  final String? subtext;
  const LoginTitleMainBar({super.key, this.image, this.text, this.subtext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.h,
        ),
        Image.asset(
          image!
          // ImageResources.namaste,
          ,
          height: 8.h,
        ),
        SizedBox(
          width: 4.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text!,
                style: Style_File.onboardtitle.copyWith(fontSize: 18.sp)),
            Text(subtext!,
                style: Style_File.onboardsubtitle.copyWith(fontSize: 15.sp)),
          ],
        ),
      ],
    );
  }
}
