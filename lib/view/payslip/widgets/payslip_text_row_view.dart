import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class PayslipTextRowView extends StatelessWidget {
  final String title, value;
  final bool isSwitch;
  const PayslipTextRowView({
    required this.title,
    required this.value,
    this.isSwitch = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!isSwitch) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                LOGIN_BUTTON_COLOR,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: ConfigStyle.boldStyleThree(
                DIMEN_FOURTEEN,
                LOGIN_BUTTON_COLOR,
              ),
            ),
            Text(
              value,
              style: ConfigStyle.regularStyleThree(
                DIMEN_FOURTEEN,
                BLACK_LIGHT,
              ),
            ),
          ],
        ),
      );
    }
  }
}
