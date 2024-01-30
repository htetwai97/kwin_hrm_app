import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class GenderChooseView extends StatefulWidget {
  final Function(int) onChooseRadio;
  final int? groupValue;
  const GenderChooseView({
    Key? key,
    required this.onChooseRadio,
    required this.groupValue,
  }) : super(key: key);

  @override
  State<GenderChooseView> createState() => _GenderChooseViewState();
}

class _GenderChooseViewState extends State<GenderChooseView> {
  int? groupValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      groupValue = widget.groupValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Row(
              children: [
                Text(
                  "Male",
                  style: ConfigStyle.regularStyleOne(
                      DIMEN_SIXTEEN, LOGIN_BUTTON_COLOR),
                ),
                Radio(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      widget.onChooseRadio(value ?? 0);
                      groupValue = value;
                    });
                  },
                ),
                const SizedBox(width: 10),
                Text(
                  "Female",
                  style: ConfigStyle.regularStyleOne(
                      DIMEN_SIXTEEN, LOGIN_BUTTON_COLOR),
                ),
                Radio(
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      widget.onChooseRadio(value ?? 0);
                      groupValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
            child: Center(
              child: Container(
                height: 0.6,
                color: BLACK_LIGHT,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
