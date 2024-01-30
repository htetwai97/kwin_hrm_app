import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class CommonBoxView extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final double width;
  const CommonBoxView({
    super.key,
    required this.textOne,
    required this.textTwo,
    this.width = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12, width: 0.1),
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
            textOne,
            style: ConfigStyle.boldStyleOne(
              DIMEN_SIXTEEN,
              LOGIN_BUTTON_COLOR,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            textTwo,
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
