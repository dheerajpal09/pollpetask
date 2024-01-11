import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pollpetask/page_routes/routes.dart';
import 'package:pollpetask/screens/auth/app_validator.dart';
import 'package:pollpetask/utils/buttonWidget.dart';
import 'package:pollpetask/utils/buttonWidgetLoader.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/dialog_helper.dart';
import 'package:pollpetask/utils/imageResources.dart';
import 'package:pollpetask/utils/logintitlebarwidget.dart';
import 'package:pollpetask/utils/mainBar.dart';
import 'package:pollpetask/utils/stringResources.dart';
import 'package:pollpetask/utils/style_file.dart';
import 'package:pollpetask/utils/textform.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                // height: 100.h - 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.h),
                        topRight: Radius.circular(3.h))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.all(2.5.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LoginTitleMainBar(
                              image: ImageResources.namaste,
                              text: "Namaste!",
                              subtext: "Chaliye shuru krte hai ...",
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextFormScreen(
                              //  hinttext: 'Name',
                              labeltext: "First Name",
                              icon: Icons.person,
                              textEditingController: nameController,
                              validator: AppValidator.nameValidator,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextFormScreen(
                              labeltext: "Last Name",
                              icon: Icons.person,
                              textEditingController: lastnameController,
                              validator: AppValidator.lastnameValidator,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextFormScreen(
                              labeltext: "Username",
                              icon: Icons.person,
                              textEditingController: usernameController,
                              validator: AppValidator.nameValidator,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Center(
                              child: Text(
                                error,
                                style: Style_File.subtitle.copyWith(
                                    color: Colors.red, fontSize: 15.sp),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            !isLoading
                                ? ButtonWidget(
                                    text: "Sign Up",
                                    onTap: () {
                                      if (isLoading) {
                                        return;
                                      }

                                      signup(
                                          nameController.text,
                                          lastnameController.text,
                                          usernameController.text);
                                    },
                                  )
                                : const ButtonWidgetLoader(),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: valuedata,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      valuedata = value!;
                                    });
                                  },
                                  //activeColor: ColorResources.whiteColor,
                                  // checkColor: ColorResources.primaryColor,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: Style_File.subtitle,
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text:
                                              "By creating on sign-up, you agree to \nPoolpe  "),
                                      TextSpan(
                                          text: ' Terms and condition.',
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
                              height: 5.h,
                            ),
                          ],
                        ),
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
      if (valuedata == true) {
        if (_formKey.currentState!.validate()) {
          // if (passwordController.text == confirmpasswordController.text) {
          print("object");
          DialogHelper.showFlutterToast(strMsg: "Registration Successfull!");
          // Navigator.pushNamedAndRemoveUntil(
          //     context, Routes.loginScreen, (route) => false);
          Navigator.pushNamed(context, Routes.categoryScreen);
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        setState(() {
          DialogHelper.showFlutterToast(
              strMsg: "Please accept the terms & condition");
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      DialogHelper().shoppopDialog(context);
    }
  }
}
