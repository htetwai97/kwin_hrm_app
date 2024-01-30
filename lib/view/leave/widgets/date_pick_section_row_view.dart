import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/view/leave/widgets/date_pick_detail_view.dart';

class DatePickSectionRowView extends StatelessWidget {
  final String title;
  final String selectedDate;
  final Function(DateTime) onPickDate;
  const DatePickSectionRowView({
    Key? key,
    required this.title,
    required this.selectedDate,
    required this.onPickDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
          ),
          const SizedBox(height: 10),
          DatePickView(
            dateName: selectedDate,
            onTapDateIcon: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2101),
              );
              if (picked != null) {
                onPickDate(picked);
              }
            },
          ),
        ],
      ),
    );
  }
}
