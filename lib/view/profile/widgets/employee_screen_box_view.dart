import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class EmployeeScreenBoxView extends StatelessWidget {
  const EmployeeScreenBoxView({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: scaleHeight(context) / 8,
      width: scaleWidth(context) / 2,
      decoration: BoxDecoration(
        border: Border.all(
          color: LOGIN_BUTTON_COLOR,
          width: 0.3,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: ConfigStyle.boldStyleThree(
              DIMEN_EIGHTEEN,
              LOGIN_BUTTON_COLOR,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: ConfigStyle.regularStyleTwo(
              DIMEN_FOURTEEN,
              BLACK_HEAVY,
            ),
          ),
        ],
      ),
    );
  }
}
