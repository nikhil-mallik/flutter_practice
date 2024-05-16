import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/appRoutes.constant.dart';
import 'pageNotFound.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Device Info",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      themeMode: ThemeMode.dark,
      unknownRoute:
      GetPage(name: '/notFound', page: () => const PageNotFound()),
      getPages: AppRoutes.routes,
      // home: DeviceInfoUI(),
    );
  }
}