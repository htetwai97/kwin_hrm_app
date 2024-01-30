import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';

class CategoryBoxDetailView extends StatelessWidget {
  final Color colorOne, colorTwo;
  final IconData iconData;
  final String name;
  final String taskQuantity;
  final Function onTap;
  final double width;
  final double? height;
  final double verticalMargin;
  const CategoryBoxDetailView({
    super.key,
    required this.iconData,
    required this.name,
    required this.colorOne,
    required this.colorTwo,
    required this.taskQuantity,
    required this.onTap,
    required this.width,
    this.height,
    required this.verticalMargin,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        height: (height != null) ? height : null,
        margin: EdgeInsets.symmetric(vertical: verticalMargin),
        padding: const EdgeInsets.only(left: 12, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            Functions.buildBoxShadow(),
          ],
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              colorOne,
              colorTwo,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconData,
              color: MATERIAL_COLOR,
            ),
            Text(
              name,
              style: ConfigStyle.regularStyleThree(
                DIMEN_SIXTEEN - 1,
                MATERIAL_COLOR,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  width: 4,
                  decoration: const BoxDecoration(
                    color: MATERIAL_COLOR,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  taskQuantity,
                  style: ConfigStyle.regularStyleOne(
                    DIMEN_FOURTEEN,
                    MATERIAL_COLOR,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
