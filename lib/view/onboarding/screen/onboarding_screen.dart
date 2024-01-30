import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/view/login/screen/login_screen.dart';
import 'package:hr_management_application/view/onboarding/widgets/button_elevated_view.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: scaleHeight(context),
        width: scaleWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/hr_onboard_frontground.jpg",
              width: scaleWidth(context) - 50,
            ),
            Text(
              "Welcome to KWIN Technologies HR management application",
              style: ConfigStyle.boldStyleOne(
                DIMEN_TWENTY,
                BLACK_HEAVY,
              ),
            ),
            Text(
              "Smart management of the company's employee data and enhances the process of assigning tasks to the team members for on site visiting services",
              style: ConfigStyle.regularStyleTwo(
                DIMEN_SIXTEEN,
                BLACK_LIGHT,
              ),
            ),
            ButtonElevatedView(
              title: "Get Started",
              onTap: (){
                Functions.replacementTransition(
                    context, const LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}


