import 'package:flutter/material.dart';
import 'package:pollpetask/utils/colorResources.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class LoaderScreen extends StatelessWidget {
  final Color? loadercolor;
  const LoaderScreen({this.loadercolor, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 4.h,
        height: 4.h,
        child: Center(
          child: CircularProgressIndicator(
            color: loadercolor ?? ColorResources.primaryColor,
          ),
        ),
      ),
    );
  }
}
