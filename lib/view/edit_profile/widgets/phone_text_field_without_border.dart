import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class PhoneTextFieldWithoutBorder extends StatelessWidget {
  final TextEditingController phoneController;
  final Function onChanged;
  final String title;
  final String hint;
  final String validationText;
  const PhoneTextFieldWithoutBorder({
    Key? key,
    required this.phoneController,
    required this.onChanged,
    required this.title,
    required this.hint,
    required this.validationText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            cursorColor: Colors.green,
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) {
              onChanged();
            },
            controller: phoneController,
            validator: (value) {
              String? phoneNo = value?.replaceAll(RegExp(r'\D'), '');
              if (phoneNo!.length < 9 || phoneNo.length > 11) {
                return 'Phone number must have 9 to 11 digits';
              } else if (value!.isEmpty) {
                return validationText;
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              filled: false,
              hintText: hint,
              hintStyle:
                  ConfigStyle.regularStyleTwo(DIMEN_SIXTEEN, Colors.grey),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
