import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectionStatus { online, offline }

class ConnectionListenerService {
  StreamController<ConnectionStatus> networkStatusController =
      StreamController<ConnectionStatus>();

  ConnectionListenerService() {
    Connectivity().onConnectivityChanged.listen((status) {
      networkStatusController.add(_getNetworkStatus(status));
    });
  }

  ConnectionStatus _getNetworkStatus(ConnectivityResult status) {
    return status == ConnectivityResult.mobile ||
            status == ConnectivityResult.wifi
        ? ConnectionStatus.online
        : ConnectionStatus.offline;
  }
}
