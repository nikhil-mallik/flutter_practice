import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/deviceInfoModel.dart';
import '../controller/deviceInfoController.dart';

class DeviceInfoUI extends StatelessWidget {
  DeviceInfoUI({super.key});

  DeviceInfoController deviceInfoController = Get.put(DeviceInfoController());

  Widget showCard(String name, String value) {
    return Card(
      child: ListTile(
        title: Text(
          "$name : $value",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder<AndroidDeviceInfo>(
            future: deviceInfoController.getInfo(),
            builder: (context, snapshot) {
              final data = snapshot.data!;
              deviceInfoController.deviceInfoDetails.add(DeviceInfoModel(
                brand: data.brand,
                device: data.device,
                model: data.model,
                manufacturer: data.manufacturer,
                product: data.product,
                hardware: data.hardware,
                isPhysicalDevice: data.isPhysicalDevice.toString(),
                version: data.version.release.toString(),
                board: data.board,
                bootloader: data.bootloader,
                display: data.display,
                fingerprint: data.fingerprint,
                host: data.host,
                id: data.id,
                type: data.type,
              ));
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    showCard('brand', data.brand),
                    showCard('device', data.device),
                    showCard('model', data.model),
                    showCard('manufacturer', data.manufacturer),
                    showCard('product', data.product),
                    showCard('hardware', data.hardware),
                    showCard(
                        'isPhysicalDevice', data.isPhysicalDevice.toString()),
                    showCard('version', data.version.release.toString()),
                    showCard('board', data.board),
                    showCard('bootloader', data.bootloader),
                    showCard('display', data.display),
                    showCard('fingerprint', data.fingerprint),
                    showCard('host', data.host),
                    showCard('id', data.id),
                    showCard('type', data.type),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
