import 'package:flutter/material.dart';
import 'package:pollpetask/page_routes/route_generate.dart';
import 'package:pollpetask/page_routes/routes.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Pollpey App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        initialRoute: Routes.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      );
    });
  }
}
