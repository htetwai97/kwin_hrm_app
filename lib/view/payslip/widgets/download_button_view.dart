import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class DownloadButtonView extends StatelessWidget {
  final Function onTap;
  const DownloadButtonView({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(APP_THEME_COLOR),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: SizedBox(
        height: 50,
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.picture_as_pdf_outlined,
              color: MATERIAL_COLOR,
              size: DIMEN_TWENTY_TWO,
            ),
            Text(
              "View PDF format",
              style: ConfigStyle.regularStyleThree(
                DIMEN_FOURTEEN,
                MATERIAL_COLOR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
