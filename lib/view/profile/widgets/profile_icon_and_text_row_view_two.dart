import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class ProfileIconAndTextRowViewTwo extends StatelessWidget {
  final String title, value;
  final IconData iconData;
  final Function onTapLink;
  final bool isUnderline;
  const ProfileIconAndTextRowViewTwo({
    super.key,
    required this.title,
    required this.value,
    required this.iconData,
    required this.onTapLink,
    this.isUnderline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              size: DIMEN_TWENTY_EIGHT,
              color: Colors.blueGrey,
            ),
            const SizedBox(width: 30),
            Text(
              title,
              style: ConfigStyle.regularStyleTwo(
                DIMEN_SIXTEEN,
                LOGIN_BUTTON_COLOR,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        InkWell(
          onTap: () {
            onTapLink();
          },
          child: (!isUnderline)
              ? Text(
                  value,
                  style: ConfigStyle.regularStyleTwo(
                    DIMEN_SIXTEEN,
                    APP_THEME_COLOR,
                  ),
                )
              : Text(
                  value,
                  style: ConfigStyle.regularStyleTwoWithUnderLine(
                    DIMEN_SIXTEEN,
                    APP_THEME_COLOR,
                  ),
                ),
        ),
        SizedBox(
          height: 30,
          child: Center(
            child: Container(
              height: 0.4,
              color: BLACK_LIGHT,
            ),
          ),
        )
      ],
    );
  }
}
