import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/view/assignment/widgets/drawer_list_tile_section_view.dart';

class DrawerPropertyListView extends StatelessWidget {
  final Function onTapLogOut;
  const DrawerPropertyListView({
    super.key,
    required this.onTapLogOut,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: LOGIN_BUTTON_COLOR,
          height: 168,
          width: double.infinity,
          child: Image.asset(
            "assets/images/hr_kwin_logo.png",
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: DIMEN_TWENTY),
        DrawerListTileSectionView(
          icon: Icons.logout,
          text: "Log out",
          onTap: () {
            onTapLogOut();
          },
        ),
      ],
    );
  }
}
