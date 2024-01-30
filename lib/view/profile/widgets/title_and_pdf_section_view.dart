import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';

class TitleAndPDFSectionView extends StatelessWidget {
  final String title;
  final String url;
  const TitleAndPDFSectionView({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: ConfigStyle.regularStyleThree(
            DIMEN_FOURTEEN,
            LOGIN_BUTTON_COLOR,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 400,
          width: scaleWidth(context) - 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: APP_THEME_COLOR, width: 3),
            boxShadow: [
              Functions.buildBoxShadow(),
            ],
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
          ),
        )
      ],
    );
  }
}