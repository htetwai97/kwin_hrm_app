import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/view/attendance_detail/widgets/color_explain_view.dart';

class ColorExplainSectionDetailView extends StatelessWidget {
  const ColorExplainSectionDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ColorExplainView(
          explain: "Attended Date",
          color: Colors.green,
        ),
        SizedBox(height: 10),
        ColorExplainView(
          explain: "Absent Date",
          color: Colors.red,
        ),
        SizedBox(height: 10),
        ColorExplainView(
          explain: "Paid leave",
          color: APP_THEME_COLOR,
        ),
        SizedBox(height: 10),
        ColorExplainView(
          explain: "Holidays",
          color: Colors.black,
        ),
      ],
    );
  }
}
