import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

buildPrintableData(
        String month,
        String employeeName,
        String contactNumber,
        String contactEmail,
        String entitleSalary,
        String mealAllowance,
        String travelAllowance,
        String incentive,
        String bonus,
        String overtime,
        String subtotal,
        String tax,
        String total) =>
    pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Align(
            alignment: pw.Alignment.topCenter,
            child: pw.Text(
              "K-WIN Technologies co.ltd",
              style: pw.TextStyle(
                fontSize: DIMEN_FOURTEEN + 2,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Align(
            alignment: pw.Alignment.topCenter,
            child: pw.Text(
              "Employee payslip for the month of $month",
              style: const pw.TextStyle(
                fontSize: DIMEN_FOURTEEN - 2,
              ),
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Date",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                DateTime.now().toString().substring(0, 10),
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Employee Name",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                employeeName,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Contact Number",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                contactNumber,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Contact Email",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                contactEmail,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(
            height: 40,
            child: pw.Center(
              child: pw.Container(
                height: 0.8,
                color: PdfColors.black,
              ),
            ),
          ),
          pw.Text(
            "(+)Earning",
            style: const pw.TextStyle(
              fontSize: DIMEN_FOURTEEN,
              color: PdfColors.green,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Entitled Salary",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                entitleSalary,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Meal allowance",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                mealAllowance,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Travel allowance",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                travelAllowance,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Incentive",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                incentive,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Bonus",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                bonus,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Overtime",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                overtime,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Subtotal",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                subtotal,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(
            height: 40,
            child: pw.Center(
              child: pw.Container(
                height: 0.8,
                color: PdfColors.black,
              ),
            ),
          ),
          pw.Text(
            "(-)Deduction",
            style: const pw.TextStyle(
              fontSize: DIMEN_FOURTEEN,
              color: PdfColors.red,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Tax",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                tax,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          // pw.SizedBox(height: 10),
          // pw.Row(
          //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          //   children: [
          //     pw.Text(
          //       "Penalty",
          //       style: const pw.TextStyle(
          //         fontSize: DIMEN_FOURTEEN,
          //       ),
          //     ),
          //     pw.Text(
          //       ///tax,
          //       "0.0",
          //       style: pw.TextStyle(
          //         color: const PdfColor(0.5, 0.34, 0.63, 1),
          //         fontSize: DIMEN_FOURTEEN,
          //         fontWeight: pw.FontWeight.bold,
          //       ),
          //     ),
          //   ],
          // ),
          pw.SizedBox(
            height: 40,
            child: pw.Center(
              child: pw.Container(
                height: 0.8,
                color: PdfColors.black,
              ),
            ),
          ),
          // pw.Text(
          //   "Final",
          //   style: const pw.TextStyle(
          //     fontSize: DIMEN_FOURTEEN,
          //     color: PdfColors.blue,
          //   ),
          // ),
          // pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Net Salary",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                total,
                style: pw.TextStyle(
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 40),
          pw.Align(
            alignment: pw.Alignment.bottomRight,
            child: pw.Column(children: [
              pw.Text(
                "Approved by",
                style: const pw.TextStyle(
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
              pw.Text(
                "Ma Thandar",
                style: pw.TextStyle(
                  font: pw.Font.courierBoldOblique(),
                  color: const PdfColor(0.5, 0.34, 0.63, 1),
                  fontSize: DIMEN_FOURTEEN,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
