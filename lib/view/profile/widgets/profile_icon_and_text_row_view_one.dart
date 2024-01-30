import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class ProfileIconAndTextRowViewOne extends StatelessWidget {
  final String name;
  final IconData iconData;
  const ProfileIconAndTextRowViewOne({
    super.key,
    required this.iconData,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: DIMEN_TWENTY_TWO,
            color: APP_THEME_COLOR,
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Text(
              name,
              style: ConfigStyle.regularStyleThree(
                DIMEN_FOURTEEN,
                APP_THEME_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
