import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/view/leave/widgets/drop_down_view.dart';

class DropDownSectionView extends StatelessWidget {
  final String menuTitle, selectedValue;
  final Function(String) onChoose;
  final List<String> list;
  const DropDownSectionView({
    super.key,
    required this.menuTitle,
    required this.selectedValue,
    required this.onChoose,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Leave Type",
            style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
          ),
          const SizedBox(
            height: 10,
          ),
          DropDownView(
            list: list,
            menuTitle: menuTitle,
            selectedValue: selectedValue,
            onChange: (value) {
              onChoose(value ?? "");
            },
          ),
        ],
      ),
    );
  }
}
