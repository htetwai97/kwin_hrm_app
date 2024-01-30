import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/data/vo/date_detail_vo.dart';
import 'package:hr_management_application/view/attendance_detail/widgets/date_box_detail_view.dart';

class DateBoxListView extends StatelessWidget {
  final List<DateDetailVO>? dateList;
  final String month;
  const DateBoxListView({
    super.key,
    required this.dateList,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 80,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: dateList?.length ?? 0,
          itemBuilder: (context, index) {
            return DateBoxDetailView(
              date: dateList?[index].date?.substring(8, 10) ?? "",
              month: month,
              color: (dateList?[index].type == "Attend" &&
                      dateList?[index].attendType != "Week Day")
                  ? Colors.green
                  : (dateList?[index].type == "Dismiss" &&
                          dateList?[index].source == "Leave")
                      ? APP_THEME_COLOR
                      : (dateList?[index].type == "Dismiss" &&
                              dateList?[index].source != "Leave")
                          ? Colors.red
                          : (dateList?[index].attendType == "Holiday" ||
                                  dateList?[index].attendType == "Day Off")
                              ? Colors.black
                              : Colors.red,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
        ),
      ),
    );
  }
}
