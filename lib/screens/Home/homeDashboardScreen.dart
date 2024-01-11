import 'package:flutter/material.dart';
import 'package:pollpetask/page_routes/routes.dart';
import 'package:pollpetask/utils/appBarScreen.dart';
import 'package:pollpetask/utils/blankScreenWidget.dart';
import 'package:pollpetask/utils/buttonWidget.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            text: "Home",
          )),
      body: Padding(
        padding: EdgeInsets.all(3.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlankScreensWidget(),
            SizedBox(
              height: 3.h,
            ),
            ButtonWidget(
              text: "Login To Your Account",
              onTap: () {
                Navigator.pushNamed(context, Routes.signupScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
