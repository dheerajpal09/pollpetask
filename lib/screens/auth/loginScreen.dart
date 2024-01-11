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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Find PollPe Accountt!",
                                    style: Style_File.onboardtitle),
                                Text(
                                    "Enter email, Phone Number or username \nassociated with your account to change\n your password",
                                    style: Style_File.subtitle
                                        .copyWith(fontSize: 16.sp)),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextFormScreen(
                              labeltext: "Enter phone, Enmail or Username ",
                              icon: Icons.mail,
                              textEditingController: emailController,
                              validator: AppValidator.emailValidator,
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
                            ButtonWidget(
                              text: "Next",
                              onTap: () {
                                if (isLoading) {
                                  return;
                                }
                                login(
                                  emailController.text,
                                );
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

  login(
    name,
  ) async {
    setState(() {
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        print("object");
        DialogHelper.showFlutterToast(strMsg: "send otp Successfull!");
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.otpVerificationScreen, (route) => false);

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
        isLoading = false;
      });
      DialogHelper().shoppopDialog(context);
    }
  }
}
