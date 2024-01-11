import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pollpetask/page_routes/routes.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/imageResources.dart';
import 'package:pollpetask/utils/loaderscreen.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, homePageRoute);
  }

  homePageRoute() async {
    Navigator.pushReplacementNamed(context, Routes.welcomeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageResources.appBarBackground),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: SizedBox(
                        height: 14.h,
                        child: Image.asset(
                          ImageResources.logo,
                        )),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 28.h),
                      child: Column(
                        children: [
                          const Center(
                            child: LoaderScreen(),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "PollPe - EarnKarBefikar",
                            style: TextStyle(
                                color: ColorResources.grayColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
