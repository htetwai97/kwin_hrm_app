import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';

class TaskFunctionButtonView extends StatelessWidget {
  final String name;
  final Color color;
  final Function onTap;
  const TaskFunctionButtonView({
    super.key,
    required this.name,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
        height: 36,
        width: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            Functions.buildBoxShadow(),
          ],
        ),
        child: Center(
          child: Text(
            name,
            style: ConfigStyle.boldStyleThree(
              12,
              MATERIAL_COLOR,
            ),
          ),
        ),
      ),
    );
  }
}
