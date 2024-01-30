import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';

class InfoBoxView extends StatelessWidget {
  final String title, value;
  final double padding;
  const InfoBoxView({
    super.key,
    required this.title,
    required this.value,
    this.padding = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              BLACK_LIGHT,
            ),
          ),
          Text(
            value,
            style: ConfigStyle.boldStyleThree(
              DIMEN_FOURTEEN,
              BLACK_HEAVY,
            ),
          ),
        ],
      ),
    );
  }
}
