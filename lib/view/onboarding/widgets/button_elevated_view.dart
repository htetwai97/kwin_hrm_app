import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class ButtonElevatedView extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color color;
  const ButtonElevatedView({
    required this.title,
    required this.onTap,
    this.color = APP_THEME_COLOR,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: SizedBox(
        height: 40,
        width: 100,
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
    );
  }
}
