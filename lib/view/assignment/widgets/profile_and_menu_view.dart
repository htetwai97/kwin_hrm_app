import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';

class ProfileAndMenuView extends StatelessWidget {
  final String image;
  final Function onTapMenu,onTapProfile;
  const ProfileAndMenuView({
    super.key,
    required this.image,
    required this.onTapMenu,
    required this.onTapProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            onTapMenu();
          },
          child: const Icon(
            Icons.menu_outlined,
            size: DIMEN_TWENTY_FOUR,
            color: MATERIAL_COLOR,
          ),
        ),
        InkWell(
          onTap: (){
            onTapProfile();
          },
          child: CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
              image,
            ),
          ),
        ),
      ],
    );
  }
}
