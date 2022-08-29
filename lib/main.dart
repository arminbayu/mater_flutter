import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:master/splash_screen.dart';
import 'package:master/ui/pages/home/home_index.dart';

import 'package:master/translate/_index.dart';
import 'package:master/ui/pages/slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Lang(),
      locale: Locale('en', 'US'),
      getPages: [
        // GetPage(
        //   name: '/auth',
        //   page: () => AuthIndex(),
        //   transitionDuration: Duration(microseconds: 1000),
        //   children: [
        //     GetPage(
        //       name: '/auth_input',
        //       page: () => AuthInput(),
        //       transitionDuration: Duration(microseconds: 1000),
        //     ),
        //     GetPage(
        //       name: '/auth_scan',
        //       page: () => AuthScan(),
        //       transitionDuration: Duration(microseconds: 1000),
        //     ),
        //   ],
        // ),
        GetPage(
          name: '/home',
          page: () => HomeIndex(),
          transitionDuration: Duration(microseconds: 1000),
        ),
        GetPage(
          name: '/slider',
          page: () => SliderPage(),
          transitionDuration: Duration(microseconds: 1000),
        ),
      ],
      home: SplashScreen(),
    );
  }
}
