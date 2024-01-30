import 'package:flutter/material.dart';
import 'package:hr_management_application/view/profile/widgets/employee_screen_box_view.dart';

class StatusAndDepartmentBoxesView extends StatelessWidget {
  final String titleOne, titleTwo, valueOne, valueTwo;
  const StatusAndDepartmentBoxesView({
    super.key,
    required this.titleOne,
    required this.valueOne,
    required this.titleTwo,
    required this.valueTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EmployeeScreenBoxView(title: titleOne, value: valueOne),
        EmployeeScreenBoxView(title: titleTwo, value: valueTwo),
      ],
    );
  }
}