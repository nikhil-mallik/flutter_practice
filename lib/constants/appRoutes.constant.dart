

import 'package:get/get.dart';

import '../deviceInfo/UI/deviceInfoUI.dart';
import '../googleSignIn/dashboard/dashboardUI.dart';
import '../googleSignIn/login/loginUI.dart';
import '../home/home.dart';

class AppRoutes {
  static const HOME = '/home';
  static const SIGN_IN = '/signin';
  static const DEVICE_INFO = '/deviceInfo';
  static const GOOGLE_SIGN_IN = '/googleSignIn';
  static const GOOGLE_DASHBOARD = '/googleDashboard';

  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const HomeUI()),
    GetPage(name: HOME, page: () => const HomeUI()),
    GetPage(name: DEVICE_INFO, page: () => DeviceInfoUI()),
    GetPage(name: GOOGLE_SIGN_IN, page: () =>  LoginUI()),
    GetPage(name: GOOGLE_DASHBOARD, page: () =>  DashboardUI()),
  ];
}
