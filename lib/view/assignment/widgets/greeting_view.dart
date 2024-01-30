import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class GreetingView extends StatelessWidget {
  final String name;
  final Color color;
  const GreetingView({
    super.key,
    required this.name,
    this.color = MATERIAL_COLOR
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, $name!..",
          style: ConfigStyle.regularStyleTwo(
            DIMEN_TWENTY_TWO,
            color,
          ),
        ),
        Text(
          "Have a nice day",
          style: ConfigStyle.regularStyleOne(
            DIMEN_FOURTEEN,
            color,
          ),
        ),
      ],
    );
  }
}
