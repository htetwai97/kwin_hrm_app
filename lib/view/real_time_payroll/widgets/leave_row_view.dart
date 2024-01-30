import 'package:flutter/material.dart';
import 'package:hr_management_application/view/real_time_payroll/widgets/info_box_view.dart';

class LeaveRowView extends StatelessWidget {
  final String titleOne, titleTwo, valueOne, valueTwo;
  const LeaveRowView({
    super.key,
    required this.titleOne,
    required this.titleTwo,
    required this.valueOne,
    required this.valueTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InfoBoxView(
          title: titleOne,
          value: valueOne,
          padding: 34,
        ),
        InfoBoxView(
          title: titleTwo,
          value: valueTwo,
          padding: 34,
        ),
      ],
    );
  }
}
