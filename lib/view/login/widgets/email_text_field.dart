import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';

class EmailTextFieldWidget extends StatelessWidget {
  final TextEditingController emailController;
  final Function onChanged;
  const EmailTextFieldWidget({
    super.key,
    required this.emailController,
    required this.onChanged,
  });

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
              filled: true,
              fillColor: Colors.grey.shade100,
              prefixIcon: const Icon(
                Icons.mail,
                color: Colors.grey,
              ),
              hintText: "Enter Email",
              hintStyle:
                  ConfigStyle.regularStyleTwo(DIMEN_SIXTEEN, Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(DIMEN_SIXTEEN),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(DIMEN_SIXTEEN),
                borderSide: const BorderSide(color: Colors.green),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(DIMEN_SIXTEEN),
                borderSide: const BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(DIMEN_SIXTEEN),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
