import 'package:flutter/material.dart';
import 'package:hr_management_application/view/employee/widgets/employee_item_box_view.dart';

class EmployeeChoiceRowView extends StatelessWidget {
  final String titleOne, imageOne, titleTwo, imageTwo;
  final Function onTapOne;
  final Function onTapTwo;

  const EmployeeChoiceRowView({
    super.key,
    required this.titleOne,
    required this.titleTwo,
    required this.imageOne,
    required this.imageTwo,
    required this.onTapOne,
    required this.onTapTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        EmployeeItemBoxView(
          name: titleOne,
          image: imageOne,
          onTap: () {
            onTapOne();
          },
        ),
        EmployeeItemBoxView(
          name: titleTwo,
          image: imageTwo,
          onTap: () {
            onTapTwo();
          },
        ),
      ],
    );
  }
}
