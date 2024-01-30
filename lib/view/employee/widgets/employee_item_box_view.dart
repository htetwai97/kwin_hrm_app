import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';

class EmployeeItemBoxView extends StatelessWidget {
  final String name;
  final String image;
  final Function onTap;
  const EmployeeItemBoxView({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: scaleHeight(context) / 40),
        height: scaleHeight(context) / 4.2,
        width: scaleWidth(context) / 2.4,
        decoration: BoxDecoration(
          color: MATERIAL_COLOR,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            Functions.buildBoxShadow(),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: scaleHeight(context) / 7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                ),
              ),
              Text(
                name,
                style: ConfigStyle.regularStyleTwo(
                  DIMEN_FOURTEEN,
                  BLACK_HEAVY,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
