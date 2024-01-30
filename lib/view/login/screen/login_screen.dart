import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:hr_management_application/view/login/bloc/login_bloc.dart';
import 'package:hr_management_application/view/login/widgets/email_text_field.dart';
import 'package:hr_management_application/view/login/widgets/password_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginBloc(),
      child: Container(
        color: MATERIAL_COLOR,
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/hr_login_sky_blue.jpg",
                  fit: BoxFit.fill,
                  height: scaleHeight(context),
                  width: scaleWidth(context),
                ),
                Consumer<LoginBloc>(
                  builder: (context, bloc, child) => SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: LOGIN_BUTTON_COLOR,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(80),
                                    bottomRight: Radius.circular(80)),
                              ),
                              width: 50,
                              height: 100,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: const BoxDecoration(
                                color: LOGIN_BUTTON_COLOR,
                                shape: BoxShape.circle,
                              ),
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                        SizedBox(height: scaleHeight(context) / 10),
                        Form(
                          key: bloc.emailFormKey,
                          child: EmailTextFieldWidget(
                            emailController: bloc.emailController,
                            onChanged: () {
                              bloc.emailValidate();
                            },
                          ),
                        ),
                        Form(
                          key: bloc.passwordFormKey,
                          child: PasswordTextFieldWidget(
                            passwordController: bloc.passwordController,
                            isObscure: bloc.isObscure,
                            onPressedVisibleIcon: () {
                              bloc.onTapVisibility();
                            },
                            onChanged: () {
                              bloc.passwordValidate();
                            },
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 10),
                        Consumer<LoginBloc>(
                          builder: (context, bloc, child) => Row(
                            children: [
                              Checkbox(
                                side: const BorderSide(color: Colors.black),
                                fillColor:
                                    MaterialStateProperty.all(MATERIAL_COLOR),
                                checkColor: LOGIN_BUTTON_COLOR,
                                value: value,
                                onChanged: (newValue) {
                                  setState(() {
                                    value = newValue ?? false;
                                    bloc.onCheckRememberMe(newValue ?? false);
                                  });
                                },
                              ),
                              Text(
                                "Remember me?",
                                style: ConfigStyle.regularStyleOne(
                                  DIMEN_SIXTEEN,
                                  LOGIN_BUTTON_COLOR,
                                ),
                              ),
                              const Spacer(),
                              MaterialButton(
                                onPressed: () {
                                  if (bloc.isLoginUnlock) {
                                    bloc.onTapLogin().then(
                                          (value) =>
                                              Functions.replacementTransition(
                                            context,
                                            const BottomNavigationScreen(),
                                          ),
                                        );
                                  }
                                },
                                minWidth: 140,
                                height: 40,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                color: bloc.isLoginUnlock
                                    ? LOGIN_BUTTON_COLOR
                                    : Colors.grey,
                                child: Text(
                                  "Login",
                                  style: ConfigStyle.boldStyleTwo(
                                      DIMEN_EIGHTEEN, MATERIAL_COLOR),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: LOGIN_BUTTON_COLOR,
                                shape: BoxShape.circle,
                              ),
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: const BoxDecoration(
                                color: LOGIN_BUTTON_COLOR,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(80),
                                    bottomLeft: Radius.circular(80)),
                              ),
                              width: 50,
                              height: 100,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Consumer<LoginBloc>(
                  builder: (context, bloc, child) => Visibility(
                    visible: bloc.isLoading,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: LOGIN_BUTTON_COLOR,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
