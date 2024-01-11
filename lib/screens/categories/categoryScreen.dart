import 'package:flutter/material.dart';
import 'package:pollpetask/utils/categorymainbar.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/imageResources.dart';
import 'package:pollpetask/utils/style_file.dart';
import 'package:pollpetask/utils/titletextstyle.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Sceen",
        ),
        backgroundColor: ColorResources.appbackgroundpinkColor,
      ),
      body: Container(
        height: 100.h,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageResources.appBarBackground),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CategoryMainBar(
                text: "Select Your Goal",
                subtext: "PollPe: Earn Cash for Opinions.",
              ),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 2.h, left: 2.5.h, right: 2.5.h, bottom: 2.h),
                      child: Column(
                        children: [
                          Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2.w),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1.5,
                                  blurRadius: 1,
                                  offset: const Offset(1, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 0.5.h,
                                  bottom: 0.5.h,
                                  right: 2.w,
                                  left: 2.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 2.h,
                                      backgroundImage: const AssetImage(
                                        ImageResources.logo,
                                      )),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleTextStyle(
                                        text: "Earn Rewards daily",
                                        style: Style_File.texttitlemain
                                            .copyWith(
                                                color:
                                                    ColorResources.primaryDark,
                                                fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      TitleTextStyle(
                                        text:
                                            "Earn Rewards daily by giving your opinions.",
                                        style: Style_File.subtitle.copyWith(
                                            color: ColorResources.blackColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
