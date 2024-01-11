import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pollpetask/page_routes/routes.dart';
import 'package:pollpetask/screens/auth/app_validator.dart';
import 'package:pollpetask/utils/buttonWidget.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/dialog_helper.dart';
import 'package:pollpetask/utils/imageResources.dart';
import 'package:pollpetask/utils/logintitlebarwidget.dart';
import 'package:pollpetask/utils/mainBar.dart';
import 'package:pollpetask/utils/socialloginbutton.dart';
import 'package:pollpetask/utils/style_file.dart';
import 'package:pollpetask/utils/textform.dart';
import 'package:pollpetask/utils/titletextstyle.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class LoginsocialScreen extends StatefulWidget {
  const LoginsocialScreen({super.key});

  @override
  State<LoginsocialScreen> createState() => _LoginsocialScreenState();
}

class _LoginsocialScreenState extends State<LoginsocialScreen> {
  bool firstvalue = false;
  final _formKey = GlobalKey<FormState>();

  bool valuedata = false;
  String error = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

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
                height: 100.h - 10.h,
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
                            text: "Sign in with Google",
                            onTap: () {},
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SocialButtonWidget(
                            image: ImageResources.trucallericon,
                            text: "Sign in with Truecaller",
                            onTap: () {},
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
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormScreen(
                                  labeltext: "Enter phone, Email or Username ",
                                  icon: Icons.mail,
                                  textEditingController: emailController,
                                  validator: AppValidator.emailValidator,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                TextFormScreen(
                                  labeltext: "Password",
                                  icon: Icons.lock,
                                  textEditingController: passwordController,
                                  validator: AppValidator.passwordValidator,
                                  suffixIcon: true,
                                  obscure: _obscureText,
                                  onPressed: _toggle,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Center(
                                  child: Text(
                                    error,
                                    style: Style_File.subtitle.copyWith(
                                        color: Colors.red, fontSize: 15.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          ButtonWidget(
                            text: "Continue",
                            onTap: () {
                              if (isLoading) {
                                return;
                              }

                              login(
                                emailController.text,
                                passwordController,
                              );
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: Style_File.title,
                                  children: <TextSpan>[
                                    const TextSpan(text: "Forgot Password? "),
                                    TextSpan(
                                        text: 'Click Here',
                                        style: Style_File.title.copyWith(
                                          color: ColorResources.primaryColor,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context,
                                                Routes
                                                    .loginScreen); // forgot password
                                          }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
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

  login(email, password) async {
    setState(() {
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      // if (valuedata == true) {
      if (_formKey.currentState!.validate()) {
        // if (passwordController.text == confirmpasswordController.text) {
        print("object");
        DialogHelper.showFlutterToast(strMsg: "login Successfull!");
        // Navigator.pushNamedAndRemoveUntil(
        //     context, Routes.signupScreen, (route) => false);
        Navigator.pushNamed(context, Routes.verifyphoneScreen);
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
