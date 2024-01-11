import 'package:flutter/material.dart';
import 'package:pollpetask/page_routes/routes.dart';
import 'package:pollpetask/screens/Home/homeDashboardScreen.dart';
import 'package:pollpetask/screens/auth/changenewPassword.dart';
import 'package:pollpetask/screens/auth/loginScreen.dart';
import 'package:pollpetask/screens/auth/loginsocialScreen.dart';
import 'package:pollpetask/screens/auth/otpVerificationScreen.dart';
import 'package:pollpetask/screens/auth/signupScreen.dart';
import 'package:pollpetask/screens/auth/verifyphoneScreen.dart';
import 'package:pollpetask/screens/categories/categoryScreen.dart';
import 'package:pollpetask/screens/splash/splashScreen.dart';
import 'package:pollpetask/screens/welcome/welcomescreen.dart';
import 'package:pollpetask/utils/stringResources.dart';
import 'package:pollpetask/utils/webViewScreensShow.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    Widget widgetScreen;
    switch (settings.name) {
      case Routes.splashScreen:
        widgetScreen = const SplashScreen();
        break;

      case Routes.homeDashboardScreen:
        widgetScreen = const HomeDashboardScreen();
        break;

      case Routes.signupScreen:
        widgetScreen = const SignupScreen();
        break;

      case Routes.webViewScreensShow:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = WebViewScreensShow(
          url: args[StringResources.url],
        );
        break;
      case Routes.categoryScreen:
        widgetScreen = const CategoryScreen();
        break;
      case Routes.loginScreen:
        widgetScreen = const LoginScreen();
        break;

      case Routes.welcomeScreen:
        widgetScreen = const WelcomeScreen();
        break;
      case Routes.loginsocialScreen:
        widgetScreen = const LoginsocialScreen();
        break;
      case Routes.verifyphoneScreen:
        widgetScreen = const VerifyphoneScreen();
        break;
      case Routes.otpVerificationScreen:
        widgetScreen = const OtpVerificationScreen();
        break;
      case Routes.changeNewPasswordScreen:
        widgetScreen = const ChangeNewPasswordScreen();
        break;

      default:
        widgetScreen = const SplashScreen();
    }
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => widgetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  }
}
