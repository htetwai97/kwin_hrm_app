import 'package:flutter/material.dart';
import 'package:hr_management_application/connection_test_service/connection_listener_service.dart';
import 'package:hr_management_application/connection_test_service/connection_listener_widget.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';

class ScaffoldWithConnectionStatus extends StatelessWidget {
  final Widget child;

  const ScaffoldWithConnectionStatus({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectionStatus>(
        initialData: ConnectionStatus.online,
        stream: ConnectionListenerService().networkStatusController.stream,
        builder: (context, snapshot) {
          return Scaffold(
            body: ConnectionListenerWidget(
              child: (snapshot.data == ConnectionStatus.online)
                  ? child
                  : Center(
                      child: Text(
                        "No Internet Connection..",
                        style: ConfigStyle.regularStyleOne(
                          DIMEN_SIXTEEN,
                          BLACK_LIGHT,
                        ),
                      ),
                    ),
            ),
          );
        });
  }
}
