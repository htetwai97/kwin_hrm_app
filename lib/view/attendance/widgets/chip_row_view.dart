import 'package:flutter/material.dart';
import 'package:hr_management_application/view/attendance/widgets/chip_item_detail_view.dart';

class ChipRowView extends StatefulWidget {
  final Function(int) onChosen;

  const ChipRowView({
    super.key,
    required this.onChosen,
  });

  @override
  State<ChipRowView> createState() => _ChipRowViewState();
}

class _ChipRowViewState extends State<ChipRowView> {
  List<Map> chipNames = [
    {"chipName": "Office", "isSelected": true},
    {"chipName": "Field", "isSelected": false},
    {"chipName": "Total", "isSelected": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 30,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 30),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: chipNames.length,
          itemBuilder: (context, index) {
            return ChipItemDetailView(
              chipName: chipNames[index]["chipName"],
              isSelected: chipNames[index]["isSelected"],
              onChosen: () {
                setState(() {
                  chipNames = [
                    {"chipName": "Office", "isSelected": false},
                    {"chipName": "Field", "isSelected": false},
                    {"chipName": "Total", "isSelected": false},
                  ];
                  chipNames[index]["isSelected"] = true;
                });
                widget.onChosen(index);
              },
            );
          },
        ),
      ),
    );
  }
}
