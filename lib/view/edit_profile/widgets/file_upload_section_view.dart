import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class FileUploadSectionView extends StatelessWidget {
  final String title, fileName;
  final IconData iconData;
  final Function onTapFile, onTapRemoveFile;
  const FileUploadSectionView({
    super.key,
    required this.title,
    required this.fileName,
    required this.iconData,
    required this.onTapFile,
    required this.onTapRemoveFile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
              ),
              InkWell(
                onTap: () {
                  onTapFile();
                },
                child: Icon(
                  iconData,
                  color: LOGIN_BUTTON_COLOR,
                  size: DIMEN_TWENTY_SIX,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Visibility(
                visible: fileName != "",
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade200),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        onTapRemoveFile();
                      },
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 40),
              Text(
                fileName,
                style:
                    ConfigStyle.regularStyleThree(DIMEN_FOURTEEN, BLACK_HEAVY),
              ),
            ],
          ),
          SizedBox(
            height: 30,
            child: Center(
              child: Container(
                height: 0.6,
                color: BLACK_LIGHT,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
