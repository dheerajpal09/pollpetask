import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pollpetask/page_routes/routes.dart';
import 'package:pollpetask/utils/buttonWidget.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/imageResources.dart';
import 'package:pollpetask/utils/logintitlebarwidget.dart';
import 'package:pollpetask/utils/mainBar.dart';
import 'package:pollpetask/utils/socialloginbutton.dart';
import 'package:pollpetask/utils/style_file.dart';
import 'package:pollpetask/utils/titletextstyle.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class VerifyphoneScreen extends StatefulWidget {
  const VerifyphoneScreen({super.key});

  @override
  State<VerifyphoneScreen> createState() => _VerifyphoneScreenState();
}

class _VerifyphoneScreenState extends State<VerifyphoneScreen> {
  bool firstvalue = false;
  final _formKey = GlobalKey<FormState>();

  bool valuedata = false;
  String error = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  final bool _obscureText = true;
  final bool _obscureText1 = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        decoration: BoxDecoration(color: ColorResources.appbackgroundpinkColor
            //     image: DecorationImage(
            //   image: AssetImage(ImageResources.appBarBackground),
            //   fit: BoxFit.cover,
            // )
            ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MainBar(),
              Container(
                height: 100.h - 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.h),
                        topRight: Radius.circular(3.h))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.5.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const LoginTitleMainBar(
                              image: ImageResources.phone,
                              text: "Hi, Amar Singh",
                              subtext: "Nice to meet you"),
                          SizedBox(
                            height: 4.h,
                          ),
                          const SocialButtonWidget(
                            image: ImageResources.trucallericon,
                            text: "Verify with Truecaller",
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          TitleTextStyle(
                            text: "⸺⸺⸺⸺ or ⸺⸺⸺⸺",
                            style: Style_File.subtitle.copyWith(
                                color: ColorResources.grayColor,
                                fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          IntlPhoneField(
                            decoration: InputDecoration(
                              labelText: 'Mobile',
                              labelStyle: TextStyle(
                                  fontSize: 15.sp, fontFamily: 'Poppins'),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.w)),
                              ),
                            ),
                            controller: mobileController,
                            initialCountryCode: 'IN',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Center(
                            child: Text(
                              error,
                              style: Style_File.subtitle
                                  .copyWith(color: Colors.red, fontSize: 15.sp),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          ButtonWidget(
                            text: "Continue",
                            onTap: () {
                              Navigator.pushNamed(context,
                                  Routes.categoryScreen); // forgot password
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Flexible(
                            child: Text(
                                "You may receive sms notifications from us for security and login purpose",
                                maxLines: 2,
                                style: Style_File.onboardsubtitle
                                    .copyWith(fontSize: 15.sp)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
