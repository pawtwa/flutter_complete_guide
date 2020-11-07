import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

class ConnectionService {
  static Connectivity _connectivity;

  static Future<bool> hasConnection() async {
    ConnectionService._setConnectivity();
    try {
      ConnectivityResult result =
          await ConnectionService._connectivity.checkConnectivity();
      return ConnectionService.checkConnectivityResult(result);
    } on PlatformException catch (_) {
      return false;
    }
  }

  static StreamSubscription<ConnectivityResult> onConnectivityChanged(
      Function callback) {
    ConnectionService._setConnectivity();
    return ConnectionService._connectivity.onConnectivityChanged
        .listen(callback);
  }

  static bool checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.none:
      default:
        return false;
    }
  }

  static void _setConnectivity() {
    if (ConnectionService._connectivity == null) {
      ConnectionService._connectivity = Connectivity();
    }
  }
}
