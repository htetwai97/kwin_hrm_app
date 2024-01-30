import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MarketReportFilePickView extends StatelessWidget {
  final String title, fileName;
  final Function onPickFile;
  const MarketReportFilePickView({
    Key? key,
    required this.title,
    required this.fileName,
    required this.onPickFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: scaleWidth(context) / 20,
              vertical: scaleWidth(context) / 65,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: BLACK_LIGHT,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: scaleWidth(context) - 200,
                  child: Text(
                    fileName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: ConfigStyle.regularStyleTwo(
                      DIMEN_FOURTEEN,
                      BLACK_LIGHT,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onPickFile();
                  },
                  icon: const Icon(
                    MdiIcons.file,
                    color: LOGIN_BUTTON_COLOR,
                    size: DIMEN_TWENTY_SIX,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
