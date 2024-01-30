import 'package:flutter/material.dart';
import 'package:hr_management_application/view/real_time_payroll/widgets/info_box_view.dart';

class PresentAbsentHolidayView extends StatelessWidget {
  final String titleOne, titleTwo, titleThree, valueOne, valueTwo, valueThree;
  const PresentAbsentHolidayView({
    super.key,
    required this.titleOne,
    required this.titleTwo,
    required this.titleThree,
    required this.valueOne,
    required this.valueTwo,
    required this.valueThree,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InfoBoxView(
          title: titleOne,
          value: valueOne,
          padding: 15,
        ),
        InfoBoxView(
          title: titleTwo,
          value: valueTwo,
          padding: 15,
        ),
        InfoBoxView(
          title: titleThree,
          value: valueThree,
          padding: 15,
        ),
      ],
    );
  }
}
