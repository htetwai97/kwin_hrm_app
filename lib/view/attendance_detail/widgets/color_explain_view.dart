import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class ColorExplainView extends StatelessWidget {
  final String explain;
  final Color color;
  const ColorExplainView({
    super.key,
    required this.color,
    required this.explain,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 30),
          Text(
            explain,
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
