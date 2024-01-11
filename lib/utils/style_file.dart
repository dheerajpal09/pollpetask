import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Style_File {
  static final logintext = TextStyle(
    color: Colors.grey,
    fontSize: 16.sp,
    fontFamily: 'Poppins',
  );

  static final title = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
      color: Colors.black);

  static final texttitlemain = TextStyle(
    color: Colors.black,
    fontSize: 17.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );

  static final onboardtitle = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black);
  static final onboardsubtitle = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w400, color: Colors.black);
  static final onboardbody = TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w300, color: Colors.black);

  static final intotitle = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Colors.white);
  static final intosubtitle =
      TextStyle(fontSize: 16.sp, fontFamily: 'Poppins', color: Colors.white);

  static final detailstitle = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
      color: Colors.black);

  static final subtitle =
      TextStyle(fontSize: 14.sp, fontFamily: 'Poppins', color: Colors.grey);
  static final detailsubtitle =
      TextStyle(fontSize: 15.sp, fontFamily: 'Poppins', color: Colors.black);
}
