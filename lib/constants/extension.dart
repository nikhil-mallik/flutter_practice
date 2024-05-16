import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appColors.dart';

enum MessageType { Info, Success, Warning, Error }

extension showAppSnackBar on MessageType {
  void snackBar(String strMessage) {
    Get.snackbar(
      '',
      '',
      titleText: Container(),
      messageText: Center(
        child: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            strMessage,
            style: TextStyle(
              color: this == MessageType.Info
                  ? AppColors.appMessageInfoTextColor
                  : this == MessageType.Success
                      ? AppColors.appMessageSuccessTextColor
                      : this == MessageType.Warning
                          ? AppColors.appMessageWarningTextColor
                          : this == MessageType.Error
                              ? AppColors.appMessageErrorTextColor
                              : AppColors.appColorBlack,
              fontSize: 16,
            ),
          ),
        ),
      ),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      backgroundColor: this == MessageType.Info
          ? AppColors.appMessageInfoBgColor
          : this == MessageType.Success
              ? AppColors.appMessageSuccessBgColor
              : this == MessageType.Warning
                  ? AppColors.appMessageWarningBgColor
                  : this == MessageType.Error
                      ? AppColors.appMessageErroBgColor
                      : AppColors.appColorBlack,
      colorText: this == MessageType.Info
          ? AppColors.appMessageInfoTextColor
          : this == MessageType.Success
              ? AppColors.appMessageSuccessTextColor
              : this == MessageType.Warning
                  ? AppColors.appMessageWarningTextColor
                  : this == MessageType.Error
                      ? AppColors.appMessageErrorTextColor
                      : AppColors.appColorBlack,
      margin: const EdgeInsets.all(10.0),
      borderRadius: 5,
      icon: Icon(
        this == MessageType.Info
            ? Icons.info_outline
            : this == MessageType.Success
                ? Icons.done
                : this == MessageType.Warning
                    ? Icons.warning_amber_outlined
                    : this == MessageType.Error
                        ? Icons.error_outline
                        : Icons.warning_amber_outlined,
        color: this == MessageType.Info
            ? AppColors.appMessageInfoTextColor
            : this == MessageType.Success
                ? AppColors.appMessageSuccessTextColor
                : this == MessageType.Warning
                    ? AppColors.appMessageWarningTextColor
                    : this == MessageType.Error
                        ? AppColors.appMessageErrorTextColor
                        : AppColors.appColorBlack,
      ),
    );
  }
}
