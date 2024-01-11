import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pollpetask/page_routes/routes.dart';
import 'package:pollpetask/screens/auth/app_validator.dart';
import 'package:pollpetask/utils/buttonWidget.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/dialog_helper.dart';
import 'package:pollpetask/utils/mainBar.dart';
import 'package:pollpetask/utils/style_file.dart';
import 'package:pollpetask/utils/textform.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ChangeNewPasswordScreen extends StatefulWidget {
  const ChangeNewPasswordScreen({super.key});

  @override
  State<ChangeNewPasswordScreen> createState() =>
      _ChangeNewPasswordScreenState();
}

class _ChangeNewPasswordScreenState extends State<ChangeNewPasswordScreen> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MainBar(),
              Container(
                height: 100.h - 30.h,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Great! All Done Amar",
                                    style: Style_File.onboardtitle
                                        .copyWith(fontSize: 18.sp)),
                                Text("Just last, Setup Password",
                                    style: Style_File.subtitle
                                        .copyWith(fontSize: 16.sp)),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
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
                            TextFormScreen(
                              labeltext: "Confirm Password",
                              icon: Icons.lock,
                              textEditingController: confirmpasswordController,
                              validator: AppValidator.confirm_passwordValidator,
                              suffixIcon: true,
                              obscure: _obscureText1,
                              onPressed: _toggle1,
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
                            ButtonWidget(
                              text: "Get Started",
                              onTap: () {
                                if (isLoading) {
                                  return;
                                }
                                changenewpassword(passwordController.text,
                                    confirmpasswordController.text);
                              },
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

  changenewpassword(password, confirmnewpassword) async {
    setState(() {
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (passwordController.text == confirmpasswordController.text) {
          print("object");
          DialogHelper.showFlutterToast(strMsg: "Change password Successfull!");
          // Navigator.pushNamedAndRemoveUntil(
          //     context, Routes.loginScreen, (route) => false);
          Navigator.pushNamed(context, Routes.loginsocialScreen);
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() {
            error = "Confirm password must be match";
            isLoading = false;
          });

          DialogHelper.showFlutterToast(
              strMsg: "Confirm password must be match");
        }
      } else {
        setState(() {
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
