import 'dart:async';

import 'package:cloud_walk_test/app/styles/app_text_style.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class AppGetXController<T> extends GetxController {
  //region variables
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  final _blocked = false.obs;

  //endregion

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    connectivitySubscription = connectivity.onConnectivityChanged.listen(_statusResult);
  }

  //region offilne treatment
  //region initConnection
  Future<void> initConnection() async {
    late ConnectivityResult result;
    try {
      result = await Connectivity().checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }

    return _statusResult(result);
  }

  //endregion

  //region statusResult
  Future<void> _statusResult(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      setBlockedStatus(status: true);
      return showNetworkView();
    } else {
      if (_blocked.value) {
        setBlockedStatus(status: false);
        Get.back();
      }
    }
  }

  void setBlockedStatus({bool status = false}) {
    _blocked.value = status;
  }

  void showNetworkView() {
    Get.bottomSheet(
      Container(
        height: Get.height,
        width: Get.width,
        child: Container(
          color: Colors.blue.shade900,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.info_outline, color: Colors.white, size: 50),
                const SizedBox(height: 20),
                Text(
                  'Estamos sem internet, verifique se o modo Avião está ligado! Caso estiver, desligue e retorne a utilizar o nosso aplicativo...',
                  style: AppTextStyle.headlineSmall(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
