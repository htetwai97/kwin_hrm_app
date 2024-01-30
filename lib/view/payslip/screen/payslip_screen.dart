import 'package:flutter/material.dart';
import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/view/payslip/bloc/payslip_bloc.dart';
import 'package:hr_management_application/view/payslip/widgets/download_button_view.dart';
import 'package:hr_management_application/view/payslip/widgets/month_box_list_view.dart';
import 'package:hr_management_application/view/payslip/widgets/pdf_payslip_view.dart';
import 'package:hr_management_application/view/payslip/widgets/widget_pdf_data_view.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

class PayslipScreen extends StatelessWidget {
  const PayslipScreen({Key? key}) : super(key: key);

  Future<void> _printDoc(
      String month,
      String employeeName,
      String contactNum,
      String contactEmail,
      String entitleSalary,
      String mealAllowance,
      String travelAllowance,
      String incentive,
      String bonus,
      String overtime,
      String subtotal,
      String tax,
      String total) async {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return buildPrintableData(
              month,
              employeeName,
              contactNum,
              contactEmail,
              entitleSalary,
              mealAllowance,
              travelAllowance,
              incentive,
              bonus,
              overtime,
              subtotal,
              tax,
              total);
        },
      ),
    );
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => PayslipBloc(),
          child: Scaffold(
            backgroundColor: MATERIAL_COLOR,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: APP_THEME_COLOR,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: MATERIAL_COLOR,
                ),
              ),
              title: Text(
                "Payslip",
                style: ConfigStyle.boldStyleThree(
                  DIMEN_TWENTY_TWO,
                  MATERIAL_COLOR,
                ),
              ),
            ),
            body: Selector<PayslipBloc, bool>(
                builder: (context, isLoading, child) {
                  if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Consumer<PayslipBloc>(
                            builder: (context, bloc, child) => MonthBoxListView(
                              currentMonth: bloc.month,
                              onTapMonth: (month) {
                                bloc.onTapMonth(month);
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          Consumer<PayslipBloc>(
                            builder: (context, bloc, child) =>
                                (bloc.paySlipList.length == 0)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 60),
                                        child: Image.asset(
                                          "assets/images/salary-slip.jpg",
                                          width: 300,
                                          height: 300,
                                        ),
                                      )
                                    : WidgetPdfDataView(
                                        entitleSalary: bloc
                                                .paySlipData?.entitledSalary
                                                ?.toString() ??
                                            "0.0",
                                        mealAllowance: bloc
                                                .paySlipData?.maTotalAmount
                                                ?.toString() ??
                                            "0.0",
                                        travelAllowance: bloc
                                                .paySlipData?.travelTotalAmount
                                                ?.toString() ??
                                            "0.0",
                                        incentive: bloc
                                                .paySlipData?.incentiveAmount
                                                ?.toString() ??
                                            "0.0",
                                        bonus: bloc.paySlipData?.bonusAmount
                                                ?.toString() ??
                                            "0.0",
                                        overtime: bloc
                                                .paySlipData?.otTotalAmount
                                                ?.toString() ??
                                            "0.0",
                                        subtotal: bloc.paySlipData?.subTotal
                                                ?.toString() ??
                                            "0.0",
                                        tax: bloc.paySlipData?.incomeTaxAmount
                                                ?.toString() ??
                                            "0.0",
                                        total: bloc.paySlipData?.netSalary
                                                ?.toString() ??
                                            "0.0",
                                      ),
                          ),
                          const SizedBox(height: 40),
                          Consumer<PayslipBloc>(
                            builder: (context, bloc, child) =>
                                (bloc.paySlipList.length == 0)
                                    ? Text(
                                        "No payslip for that month",
                                        style: ConfigStyle.regularStyleTwo(
                                          16,
                                          BLACK_HEAVY,
                                        ),
                                      )
                                    : DownloadButtonView(
                                        onTap: () {
                                          _printDoc(
                                            bloc.month,
                                            bloc.userDataVO?.givenName ?? "",
                                            bloc.userDataVO?.phone ?? "",
                                            bloc.userDataVO?.email ?? "",
                                            bloc.paySlipData?.entitledSalary
                                                    ?.toString() ??
                                                "0.0",
                                            bloc.paySlipData?.maTotalAmount
                                                    ?.toString() ??
                                                "0.0",
                                            bloc.paySlipData?.travelTotalAmount
                                                    ?.toString() ??
                                                "0.0",
                                            bloc.paySlipData?.incentiveAmount
                                                    ?.toString() ??
                                                "0.0",
                                            bloc.paySlipData?.bonusAmount
                                                    ?.toString() ??
                                                "0.0",
                                            bloc.paySlipData?.otTotalAmount
                                                    ?.toString() ??
                                                "0.0",
                                            bloc.paySlipData?.subTotal
                                                    ?.toString() ??
                                                "0.0",
                                            bloc.paySlipData?.incomeTaxAmount
                                                    ?.toString() ??
                                                "0.0",
                                            bloc.paySlipData?.netSalary
                                                    ?.toString() ??
                                                "0.0",
                                          );
                                        },
                                      ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  }
                },
                selector: (context, bloc) => bloc.isLoading),
          ),
        ),
      ),
    );
  }
}
