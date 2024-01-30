import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class RulesAndRegulationScreen extends StatelessWidget {
  const RulesAndRegulationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MATERIAL_COLOR,
      appBar: AppBar(
        backgroundColor: APP_THEME_COLOR,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: MATERIAL_COLOR,
            size: 24,
          ),
        ),
        title: Text(
          "Rules and Regulations",
          style: ConfigStyle.regularStyleTwo(
            18,
            MATERIAL_COLOR,
          ),
        ),
      ),
      body: Center(
        child: Image.asset("assets/images/boo_image.jpg"),
      ),
    );
  }
}
