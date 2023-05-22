import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class BasicBloc<T> extends GetxController {
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
            color: Colors.red,
          ),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ));
  }
}
