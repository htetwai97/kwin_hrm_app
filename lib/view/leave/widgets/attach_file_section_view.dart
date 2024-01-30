import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AttachFileSectionView extends StatelessWidget {
  final String fileName;
  final Function onChooseFile;
  const AttachFileSectionView({
    super.key,
    required this.fileName,
    required this.onChooseFile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Attach File",
            style: ConfigStyle.boldStyleOne(
              DIMEN_SIXTEEN,
              BLACK_HEAVY,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: BLACK_LIGHT,
                  width: 0.5,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fileName,
                  style: ConfigStyle.regularStyleThree(
                    DIMEN_FOURTEEN,
                    BLACK_LIGHT,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onChooseFile();
                  },
                  icon: const Icon(
                    MdiIcons.attachment,
                    color: Colors.green,
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
