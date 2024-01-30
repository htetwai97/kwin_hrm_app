import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class PayslipHeaderAndLineView extends StatelessWidget {
  final String header;
  final Color color;
  const PayslipHeaderAndLineView({
    Key? key,
    required this.color,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        header,
        style: ConfigStyle.regularStyleThree(
          DIMEN_FOURTEEN,
          color,
        ),
      ),
    );
  }
}
