
import 'package:get/get.dart';

import '../deviceInfo/UI/deviceInfoUI.dart';
import '../home/home.dart';

class AppRoutes {
  static const HOME = '/home';
  static const SIGN_IN = '/signin';
  static const DEVICE_INFO = '/deviceInfo';

  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const HomeUI()),
    GetPage(name: HOME, page: () => const HomeUI()),
    GetPage(name: DEVICE_INFO, page: () => DeviceInfoUI()),
  ];
}
