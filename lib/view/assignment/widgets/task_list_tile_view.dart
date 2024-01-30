import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/view/assignment/widgets/task_function_button_view.dart';

class TaskListTileView extends StatelessWidget {
  final String? name, date;
  final IconData iconData;
  final Color iconColor;
  final Function onTapCheckIn, onTapCheckOut, onTapReport;
  final bool isCompleteAll;
  final bool isDueToday;
  final bool reportStatus, checkInStatus, checkOutStatus;
  const TaskListTileView({
    super.key,
    required this.name,
    required this.date,
    required this.onTapCheckIn,
    required this.iconData,
    required this.iconColor,
    required this.onTapReport,
    required this.onTapCheckOut,
    this.checkInStatus = false,
    this.checkOutStatus = false,
    this.reportStatus = false,
    this.isDueToday = false,
    this.isCompleteAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          style: ListTileStyle.drawer,
          dense: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: BLACK_LIGHT,
              width: 0.4,
            ),
          ),
          leading: Container(
            width: 44,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                iconData,
                size: DIMEN_TWENTY_TWO,
                color: MATERIAL_COLOR,
              ),
            ),
          ),
          title: Column(
            children: [
              Text(
                name ?? "",
                style: ConfigStyle.regularStyleThree(
                  DIMEN_FOURTEEN,
                  BLACK_HEAVY,
                ),
              ),
              Text(
                date ?? "",
                style: ConfigStyle.regularStyleOne(
                  DIMEN_FOURTEEN - 1,
                  BLACK_HEAVY,
                ),
              ),
            ],
          ),
          trailing: (isDueToday)
              ? Checkbox(
                  value: isCompleteAll,
                  onChanged: (value) {},
                )
              : const Icon(
                  Icons.lock,
                  size: DIMEN_TWENTY_FOUR,
                  color: Colors.grey,
                ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TaskFunctionButtonView(
              name: "Check in",
              color: (isDueToday && checkInStatus == false)
                  ? Colors.green.shade500
                  : Colors.grey,
              onTap: () {
                onTapCheckIn();
              },
            ),
            TaskFunctionButtonView(
              name: "Report",
              color: (isDueToday && reportStatus == false)
                  ? APP_THEME_COLOR
                  : Colors.grey,
              onTap: () {
                onTapReport();
              },
            ),
            TaskFunctionButtonView(
              name: "Check out",
              color: (isDueToday && checkOutStatus == false)
                  ? MENU_FIVE_COLOR
                  : Colors.grey,
              onTap: () {
                onTapCheckOut();
              },
            ),
          ],
        )
      ],
    );
  }
}
