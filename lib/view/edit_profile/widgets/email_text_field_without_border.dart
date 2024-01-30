import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class EmailTextFieldWithoutBorder extends StatelessWidget {
  final TextEditingController emailController;
  final Function onChanged;
  const EmailTextFieldWithoutBorder({
    Key? key,
    required this.onChanged,
    required this.emailController,
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
            "Email",
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
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an email';
              }
              if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                  .hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              filled: false,
              hintText: "Enter Email",
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
