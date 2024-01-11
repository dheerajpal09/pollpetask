import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pollpetask/page_routes/routes.dart';
import 'package:pollpetask/utils/buttonWidget.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/dialog_helper.dart';
import 'package:pollpetask/utils/imageResources.dart';
import 'package:pollpetask/utils/logintitlebarwidget.dart';
import 'package:pollpetask/utils/mainBar.dart';
import 'package:pollpetask/utils/socialloginbutton.dart';
import 'package:pollpetask/utils/stringResources.dart';
import 'package:pollpetask/utils/style_file.dart';
import 'package:pollpetask/utils/titletextstyle.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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

  bool _obscureText = true;
  bool _obscureText1 = true;
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
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.black,
                    //     blurRadius: 3.0,
                    //   ),
                    // ],
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
                              text: "Welcome to PollPe.",
                              subtext: "#EarnKarBefikar"),
                          SizedBox(
                            height: 4.h,
                          ),
                          SocialButtonWidget(
                            image: ImageResources.googleicon,
                            text: "Sign up with Google",
                            onTap: () {},
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: Style_File.subtitle,
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text:
                                            "By Signing up. You aggree to the terms of service and \nprivacy policy"),
                                    TextSpan(
                                        text: ' Including cookies use.',
                                        style: Style_File.onboardsubtitle
                                            .copyWith(fontSize: 14.sp),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(context,
                                                Routes.webViewScreensShow,
                                                arguments: {
                                                  StringResources.url: " "
                                                });
                                          }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
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
                          TitleTextStyle(
                            text: "Already Have an Account?",
                            style: Style_File.texttitlemain.copyWith(
                                color: ColorResources.blackColor,
                                fontSize: 15.sp),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          ButtonWidget(
                            // boxcolor: ColorResources.grayColor.withOpacity(0.6),
                            text: "Sign In",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.loginsocialScreen);
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: Style_File.title,
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: "Dont't have an Account? ",
                                    ),
                                    TextSpan(
                                        text: 'SIGNUP',
                                        style: Style_File.title.copyWith(
                                          color: ColorResources.primaryColor,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context,
                                                Routes
                                                    .signupScreen); // forgot password
                                          }),
                                  ],
                                ),
                              ),
                            ],
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

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  signup(name, lastname, username) async {
    setState(() {
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      // if (valuedata == true) {
      if (_formKey.currentState!.validate()) {
        // if (passwordController.text == confirmpasswordController.text) {
        print("object");
        DialogHelper.showFlutterToast(strMsg: "Registration Successfull!");
        // Navigator.pushNamedAndRemoveUntil(
        //     context, Routes.loginScreen, (route) => false);
        Navigator.pushNamed(context, Routes.loginScreen);
        setState(() {
          isLoading = false;
        });
        // } else {
        //   setState(() {
        //     error = "Confirm password must be match";
        //     isLoading = false;
        //   });

        //   DialogHelper.showFlutterToast(
        //       strMsg: "Confirm password must be match");
        // }
      } else {
        setState(() {
          isLoading = false;
        });
      }
      // } else {
      //   setState(() {
      //     DialogHelper.showFlutterToast(
      //         strMsg: "Please accept the terms & condition");
      //     isLoading = false;
      //   });
      // }
    } else {
      setState(() {
        isLoading = false;
      });
      DialogHelper().shoppopDialog(context);
    }
  }
}
