import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/view/attendance_detail/widgets/leave_left_box_view.dart';

class LeaveBoxesRowView extends StatelessWidget {
  final String causal, medical, maternal, vacation;
  const LeaveBoxesRowView({
    super.key,
    required this.causal,
    required this.medical,
    required this.maternal,
    required this.vacation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: DIMEN_TWENTY+10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LeaveLeftBoxView(
              title: "Causal leave left",
              value: causal,
            ),
            LeaveLeftBoxView(
              title: "Medical leave left",
              value: medical,
            ),
          ],
        ),
        const SizedBox(height: DIMEN_TWENTY+10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LeaveLeftBoxView(
              title: "Maternal leave left",
              value: maternal,
            ),
            LeaveLeftBoxView(
              title: "Vacation leave left",
              value: vacation,
            ),
          ],
        )
      ],
    );
  }
}
