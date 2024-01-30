import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';

class CheckInLoadingSectionView extends StatelessWidget {
  final String url;
  const CheckInLoadingSectionView({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: MATERIAL_COLOR,
          radius: 60,
          backgroundImage: AssetImage(
            url,
          ),
        ),
        const SizedBox(
          height: DIMEN_TWENTY,
        ),
      ],
    );
  }
}
