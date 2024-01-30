import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';

class ProfileImageFullView extends StatelessWidget {
  final String url;
  const ProfileImageFullView({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BLACK_HEAVY,
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: scaleWidth(context),
              height: scaleHeight(context),
              color: BLACK_HEAVY,
              child: Center(
                child: Container(
                  width: scaleWidth(context),
                  height: scaleHeight(context) / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  print("close");
                },
                child: const Icon(
                  Icons.close,
                  color: MATERIAL_COLOR,
                  size: DIMEN_TWENTY_EIGHT,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
