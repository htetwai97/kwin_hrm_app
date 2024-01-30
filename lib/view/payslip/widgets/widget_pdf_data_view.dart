import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/view/payslip/widgets/payslip_header_view.dart';
import 'package:hr_management_application/view/payslip/widgets/payslip_text_row_view.dart';

class WidgetPdfDataView extends StatelessWidget {
  final String entitleSalary;
  final String mealAllowance;
  final String travelAllowance;
  final String incentive;
  final String bonus;
  final String overtime;
  final String subtotal;
  final String tax;
  final String total;
  const WidgetPdfDataView({
    super.key,
    required this.entitleSalary,
    required this.mealAllowance,
    required this.travelAllowance,
    required this.incentive,
    required this.bonus,
    required this.overtime,
    required this.subtotal,
    required this.tax,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: MATERIAL_COLOR,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PayslipHeaderAndLineView(
            color: Colors.green,
            header: "(+)Earning",
          ),
          PayslipTextRowView(
            title: "Entitled Salary",
            value: entitleSalary,
          ),
          PayslipTextRowView(
            title: "Meal allowence",
            value: mealAllowance,
          ),
          PayslipTextRowView(
            title: "Travel allowence",
            value: travelAllowance,
          ),
          PayslipTextRowView(
            title: "Incentive",
            value: incentive,
          ),
          PayslipTextRowView(
            title: "Bonus",
            value: bonus,
          ),
          PayslipTextRowView(
            title: "Overtime",
            value: overtime,
          ),
          PayslipTextRowView(
            title: "Subtotal",
            value: subtotal,
          ),
          SizedBox(
            height: 30,
            child: Center(
              child: Container(
                height: 0.5,
                color: BLACK_LIGHT,
              ),
            ),
          ),
          const PayslipHeaderAndLineView(
            color: Colors.red,
            header: "(-)Deduction",
          ),
          PayslipTextRowView(
            title: "Tax",
            value: tax,
          ),
          SizedBox(
            height: 30,
            child: Center(
              child: Container(
                height: 0.5,
                color: BLACK_LIGHT,
              ),
            ),
          ),
          const PayslipHeaderAndLineView(
            color: BLACK_HEAVY,
            header: "Final",
          ),
          PayslipTextRowView(
            title: "Total",
            value: total,
          ),
        ],
      ),
    );
  }
}
