import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MonthlyAttendanceCardView extends StatelessWidget {
  final String month, detail;
  final int attendPercent;
  final Function onTapDetail;
  const MonthlyAttendanceCardView({
    super.key,
    required this.month,
    this.detail = "Detail >",
    required this.attendPercent,
    required this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    var missPercent = 100 - attendPercent;
    var progressPercent = missPercent / 100;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            month,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              LOGIN_BUTTON_COLOR,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercentIndicator(
                radius: 40,
                lineWidth: 6,
                percent: progressPercent,
                progressColor: Colors.redAccent,
                backgroundColor: Colors.greenAccent,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "$attendPercent%",
                  style: ConfigStyle.boldStyleOne(
                    DIMEN_EIGHTEEN,
                    LOGIN_BUTTON_COLOR,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Attended",
                    style: ConfigStyle.boldStyleOne(
                      DIMEN_SIXTEEN,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "$attendPercent%",
                    style: ConfigStyle.boldStyleOne(
                      DIMEN_SIXTEEN,
                      LOGIN_BUTTON_COLOR,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Missed",
                    style: ConfigStyle.boldStyleOne(
                      DIMEN_SIXTEEN,
                      Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "$missPercent%",
                    style: ConfigStyle.boldStyleOne(
                      DIMEN_SIXTEEN,
                      LOGIN_BUTTON_COLOR,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                onTapDetail();
              },
              child: Text(
                detail,
                style: ConfigStyle.regularStyleTwo(
                  DIMEN_FOURTEEN,
                  BLACK_LIGHT,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
