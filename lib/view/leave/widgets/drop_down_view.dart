import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class DropDownView extends StatefulWidget {
  final String? selectedValue;
  final List<String> list;
  final String? menuTitle;
  final Function(String?) onChange;
  const DropDownView({
    super.key,
    this.list = const ["2018", "2019", "2020", "2022", "2023"],
    this.menuTitle,
    this.selectedValue,
    required this.onChange,
  });

  @override
  State<DropDownView> createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  String? dropdownValue;
  String? menuTitle;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        alignment: Alignment.centerLeft,
        value: item,
        child: Text(
          item,
          style: ConfigStyle.regularStyleThree(DIMEN_FOURTEEN, BLACK_LIGHT),
        ),
      );

  @override
  void initState() {
    setState(() {
      menuTitle = widget.menuTitle;
      dropdownValue = widget.selectedValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //     left: scaleHeight(context) / 12,
      //     top: scaleHeight(context) / 60,
      //     bottom: scaleHeight(context) / 60),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BLACK_LIGHT, width: 0.5),
      ),
      child: Row(
        children: [
          Text(
            (dropdownValue != null && dropdownValue != "")
                ? dropdownValue!
                : menuTitle ?? "Choose Something",
            style: ConfigStyle.regularStyleTwo(
              DIMEN_FOURTEEN,
              BLACK_LIGHT,
            ),
          ),
          DropdownButton<String>(
              underline: Container(
                color: Colors.transparent,
              ),
              isDense: true,
              isExpanded: false,
              elevation: 0,
              dropdownColor: Colors.white,
              value: null,
              items: widget.list.map(buildMenuItem).toList(),
              onChanged: (value) {
                setState(() {
                  dropdownValue = value;
                  menuTitle = null;
                  widget.onChange(dropdownValue);
                });
              }),
        ],
      ),
    );
  }
}
