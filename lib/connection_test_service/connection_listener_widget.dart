import 'package:flutter/material.dart';

class ConnectionListenerWidget extends StatelessWidget {
  final Widget child;

  const ConnectionListenerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
