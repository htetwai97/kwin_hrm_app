import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class DateBoxDetailView extends StatelessWidget {
  final String date, month;
  final Color color;
  const DateBoxDetailView({
    super.key,
    required this.month,
    required this.date,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            month,
            style: ConfigStyle.boldStyleThree(
              DIMEN_SIXTEEN,
              MATERIAL_COLOR,
            ),
          ),
          Text(
            date,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              MATERIAL_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
