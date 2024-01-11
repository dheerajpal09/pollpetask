import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pollpetask/page_routes/routes.dart';
import 'package:pollpetask/utils/buttonWidget.dart';
import 'package:pollpetask/utils/colorResources.dart';
import 'package:pollpetask/utils/mainBar.dart';
import 'package:pollpetask/utils/style_file.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool firstvalue = false;
  final _formKey = GlobalKey<FormState>();
  String _finalotp = '';

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
                          Text("we have sent the otp to",
                              style: Style_File.logintext),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("+91-34567-34566 ", style: Style_File.title),
                              Icon(
                                Icons.edit,
                                color: ColorResources.primaryColor,
                                size: 2.5.h,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text("Didn't Receive OTP? Resend in 00:10",
                              style: Style_File.logintext),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.h),
                            child: PinCodeTextField(
                              appContext: context,
                              enablePinAutofill: true,
                              length: 4,
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              obscureText: false,
                              cursorColor: ColorResources.grayColor,
                              animationType: AnimationType.fade,
                              pastedTextStyle: TextStyle(
                                color: ColorResources.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  disabledColor: ColorResources.whiteColor,
                                  borderRadius: BorderRadius.circular(1.h),
                                  fieldHeight: 100.w / 7,
                                  fieldWidth: 100.w / 7,
                                  activeFillColor: ColorResources.whiteColor,
                                  inactiveColor: ColorResources.grayColor,
                                  inactiveFillColor: ColorResources.whiteColor,
                                  selectedFillColor: ColorResources.whiteColor,
                                  selectedColor: ColorResources.primaryColor,
                                  activeColor: ColorResources.primaryColor),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              onCompleted: (v) {
                                print("Completed");
                                _finalotp = v;
                                print(_finalotp);
                              },
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  // currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                return true;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Center(
                            child: Text(
                              error,
                              style: Style_File.subtitle
                                  .copyWith(color: Colors.red, fontSize: 15.sp),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ButtonWidget(
                            text: "Verify",
                            onTap: () {
                              Navigator.pushNamed(
                                  context,
                                  Routes
                                      .changeNewPasswordScreen); // forgot password
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Flexible(
                            child: Text(
                                "You may receive sms notifications from us for security and login purpose.",
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
