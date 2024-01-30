import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class ProfilePicNamePositionView extends StatelessWidget {
  final String profilePic;
  final String name;
  final String position;
  final bool isEdit;
  final Function onTapEdit;
  final File? file;
  const ProfilePicNamePositionView({
    super.key,
    required this.name,
    required this.position,
    required this.profilePic,
    this.isEdit = false,
    required this.onTapEdit,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    if (!isEdit) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            radius: 50,
            highlightColor: Colors.grey,
            borderRadius: BorderRadius.circular(45),
            onTap: () {
              onTapEdit();
            },
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                profilePic,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: ConfigStyle.boldStyleOne(
                  DIMEN_TWENTY_FOUR,
                  BLACK_HEAVY,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                position,
                style: ConfigStyle.regularStyleTwo(
                  DIMEN_FOURTEEN,
                  BLACK_HEAVY,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          InkWell(
            radius: 50,
            highlightColor: Colors.grey,
            borderRadius: BorderRadius.circular(45),
            onTap: () {
              onTapEdit();
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 6),
                    shape: BoxShape.circle,
                  ),
                  child: (file != null)
                      ? CircleAvatar(
                          radius: 34,
                          backgroundImage: FileImage(
                            file!,
                          ),
                        )
                      : CircleAvatar(
                          radius: 34,
                          backgroundImage: NetworkImage(
                            profilePic,
                          ),
                        ),
                ),
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: APP_THEME_COLOR),
                    child: const Center(
                      child: Icon(
                        Icons.edit,
                        color: MATERIAL_COLOR,
                        size: DIMEN_FOURTEEN,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: ConfigStyle.boldStyleOne(
                  DIMEN_TWENTY_FOUR,
                  BLACK_HEAVY,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                position,
                style: ConfigStyle.regularStyleTwo(
                  DIMEN_FOURTEEN,
                  BLACK_HEAVY,
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
