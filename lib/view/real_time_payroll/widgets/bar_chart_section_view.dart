import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/data/vo/chart_data_vo.dart';
import 'package:hr_management_application/data/vo/date_detail_vo.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartSectionView extends StatefulWidget {
  final List<DateDetailVO> dateList;
  const BarChartSectionView({
    super.key,
    required this.halfHeight,
    required this.dateList,
  });

  final double halfHeight;

  @override
  State<BarChartSectionView> createState() => _BarChartSectionViewState();
}

class _BarChartSectionViewState extends State<BarChartSectionView> {
  late List<ChartDataVO> chartDataList;
  List<ChartDataVO> _getChartList() {
    var list = widget.dateList.map((e) {
      var dateUtc = DateTime.parse(e.date ?? "").toUtc();
      var dateLocal = dateUtc.toLocal();
      String currentDayName = DateFormat('EEEE').format(dateLocal);
      List<String> startApi = (e.clockIn != "" && e.clockIn != null)
          ? e.clockIn!.split(":")
          : ["17", "00"];
      e.remark = ((e.clockOut == "" || e.clockOut == null) &&
              (e.clockIn != "" && e.clockIn != null))
          ? "X"
          : "";
      List<String> endApi = (e.clockOut != "" && e.clockOut != null)
          ? e.clockOut!.split(":")
          : ["17", "00"];
      int startHour = int.tryParse(startApi.first) ?? 8;
      int startMin = int.tryParse(startApi.last) ?? 0;
      int endHour =
          int.tryParse(endApi.first) ?? int.tryParse(startApi.first) ?? 9;
      int endMin = int.tryParse(endApi.last) ?? 0;
      DateTime startTime = DateTime(2023, 1, 1, startHour, startMin);
      DateTime endTime = DateTime(2023, 1, 1, endHour, endMin);
      Duration duration = endTime.difference(startTime);
      int hourDifference = duration.inHours;
      var color = (e.remark == "X") ? Colors.red : APP_THEME_COLOR;
      return ChartDataVO(
          "${e.date?.substring(8, 10)}\n${currentDayName.substring(0, 3)}",
          hourDifference.abs(),
          color);
    }).toList();
    return list;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      chartDataList = _getChartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.halfHeight,
      width: 1500,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Center(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            title: AxisTitle(
              text: "Hour",
              textStyle: ConfigStyle.regularStyleOne(
                DIMEN_FOURTEEN,
                BLACK_LIGHT,
              ),
            ),
          ),
          series: [
            StackedColumnSeries(
              dataSource: chartDataList,
              xValueMapper: (ChartDataVO chart, _) => chart.x,
              yValueMapper: (ChartDataVO chart, _) => chart.y1,
              pointColorMapper: (ChartDataVO chart, _) => chart.color,
            ),
          ],
        ),
      ),
    );
  }
}
