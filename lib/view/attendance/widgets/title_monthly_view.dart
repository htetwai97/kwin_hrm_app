import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';

class ColoredTitleForAttendanceView extends StatelessWidget {
  final String title;
  const ColoredTitleForAttendanceView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: APP_THEME_COLOR_REDUCE,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            boxShadow: [
              Functions.buildBoxShadow(),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: ConfigStyle.regularStyleThree(
                DIMEN_FOURTEEN,
                MATERIAL_COLOR,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
