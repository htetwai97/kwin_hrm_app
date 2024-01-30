import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class PaySlipMonthBoxView extends StatefulWidget {
  final String month, year;
  final Color boxColor,textColor;
  final Function onTap;
  const PaySlipMonthBoxView({
    required this.month,
    required this.year,
    required this.onTap,
    required this.boxColor,
    required this.textColor,
    super.key,
  });

  @override
  State<PaySlipMonthBoxView> createState() => _PaySlipMonthBoxViewState();
}

class _PaySlipMonthBoxViewState extends State<PaySlipMonthBoxView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: 60,
        padding: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: widget.boxColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12, width: 0.1),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(240, 240, 240, 1),
              spreadRadius: 0,
              blurRadius: 10,
              blurStyle: BlurStyle.solid,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.month,
              style: ConfigStyle.regularStyleOne(
                DIMEN_FOURTEEN,
                widget.textColor,
              ),
            ),
            Text(
              widget.year,
              style: ConfigStyle.boldStyleTwo(
                DIMEN_FOURTEEN,
                widget.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
