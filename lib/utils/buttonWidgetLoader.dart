import 'package:flutter/material.dart';
import 'package:pollpetask/utils/colorResources.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidgetLoader extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const ButtonWidgetLoader({
    super.key,
    this.text,
    this.onTap,
  });

  @override
  State<ButtonWidgetLoader> createState() => _ButtonWidgetLoaderState();
}

class _ButtonWidgetLoaderState extends State<ButtonWidgetLoader> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          height: 5.h,
          // width: 90.w,
          decoration: BoxDecoration(
            color: ColorResources.primaryColor,
            borderRadius: BorderRadius.circular(2.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(-1, 3),
              )
            ],
          ),

          child: SizedBox(
              height: 5.h,
              width: 5.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorResources.whiteColor,
                ),
              )),
        ));
  }
}
