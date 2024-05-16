import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/appRoutes.constant.dart';
import 'firebase_options.dart';
import 'pageNotFound.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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