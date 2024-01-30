import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';

class HeaderEmployeePageView extends StatelessWidget {
  const HeaderEmployeePageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(context) / 4,
      width: scaleWidth(context),
      decoration: BoxDecoration(
        color: APP_THEME_COLOR,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/hr_office_building.png",
            width: 80,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: DIMEN_FOURTEEN,
          ),
          Text(
            "Your information",
            style: ConfigStyle.regularStyleOne(
              DIMEN_SIXTEEN,
              MATERIAL_COLOR,
            ),
          )
        ],
      ),
    );
  }
}
