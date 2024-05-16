import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

import '../../model/deviceInfoModel.dart';

class DeviceInfoController extends GetxController {
  static DeviceInfoController to = Get.find();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;

  RxList<DeviceInfoModel> deviceInfoDetails = <DeviceInfoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getInfo();
  }

  Future<AndroidDeviceInfo> getInfo() async {
    return await deviceInfo.androidInfo;
  }
}
