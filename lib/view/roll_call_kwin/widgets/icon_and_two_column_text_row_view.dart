import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class IconAndTwoColumnTextRowView extends StatelessWidget {
  final String image, textOne, textTwo;
  final bool visible;
  final double width;
  const IconAndTwoColumnTextRowView({
    super.key,
    required this.image,
    required this.textOne,
    required this.textTwo,
    this.visible = false,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          width: scaleWidth(context) - (scaleWidth(context) / 1.2),
        ),
        const SizedBox(width: 30),
        Visibility(
          visible: visible,
          child: SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Latitude",
                  style: ConfigStyle.regularStyleTwo(
                    16,
                    BLACK_HEAVY,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Longitude",
                  style: ConfigStyle.regularStyleTwo(
                    16,
                    BLACK_HEAVY,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textOne,
                style: ConfigStyle.regularStyleTwo(
                  16,
                  BLACK_HEAVY,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                textTwo,
                style: ConfigStyle.regularStyleTwo(
                  16,
                  BLACK_HEAVY,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
