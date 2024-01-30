import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';

class ChipItemDetailView extends StatelessWidget {
  final String chipName;
  final bool isSelected;
  final Function onChosen;
  const ChipItemDetailView({
    super.key,
    required this.chipName,
    required this.onChosen,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChosen();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
          color: (isSelected) ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            Functions.buildBoxShadow(),
          ],
        ),
        child: Center(
          child: Text(
            chipName,
            style: ConfigStyle.regularStyleTwo(
              DIMEN_FOURTEEN,
              MATERIAL_COLOR,
            ),
          ),
        ),
      ),
    );
  }
}
