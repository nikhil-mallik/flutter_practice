import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/appRoutes.constant.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  Widget showButtonCard(BuildContext context, String name, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 5.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            showButtonCard(context, 'Device Info',
                () => Get.toNamed(AppRoutes.DEVICE_INFO)),
            showButtonCard(context, 'Google Sign In',
                () => Get.toNamed(AppRoutes.GOOGLE_SIGN_IN))
          ],
        ),
      ),
    );
  }
}
