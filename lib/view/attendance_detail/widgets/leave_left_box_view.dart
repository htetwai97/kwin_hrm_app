import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class LeaveLeftBoxView extends StatelessWidget {
  final String title;
  final String value;
  const LeaveLeftBoxView({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: DIMEN_TWENTY, vertical: DIMEN_TWENTY),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(240, 240, 240, 1),
            spreadRadius: 0,
            blurRadius: 10,
            blurStyle: BlurStyle.solid,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: ConfigStyle.boldStyleOne(
              DIMEN_SIXTEEN,
              LOGIN_BUTTON_COLOR,
            ),
          ),
          const SizedBox(height: DIMEN_SIXTEEN),
          Text(
            value,
            style: ConfigStyle.regularStyleTwo(
              DIMEN_FOURTEEN,
              LOGIN_BUTTON_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
