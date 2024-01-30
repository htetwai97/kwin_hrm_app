import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class DrawerListTileSectionView extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  const DrawerListTileSectionView({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<DrawerListTileSectionView> createState() =>
      _DrawerListTileSectionViewState();
}

class _DrawerListTileSectionViewState extends State<DrawerListTileSectionView> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.onTap();
      },
      selectedColor: Colors.green,
      dense: true,
      style: ListTileStyle.drawer,
      leading: Icon(
        widget.icon,
        color: APP_THEME_COLOR,
        size: DIMEN_TWENTY_SIX,
      ),
      title: Text(
        widget.text,
        style: ConfigStyle.regularStyleTwo(
          DIMEN_SIXTEEN,
          APP_THEME_COLOR,
        ),
      ),
    );
  }
}
