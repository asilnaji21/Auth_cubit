import 'package:flutter/material.dart';

Widget customTextForm({
  required String hintTitle,
  required TextEditingController controller,
  bool obscureText = false,
  IconData? suffixIcon,
  Function()? togglePasswordVisibility,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintTitle,
      border: const OutlineInputBorder(),
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: Icon(suffixIcon),
              onPressed: togglePasswordVisibility,
            )
          : null,
    ),
    validator: (input) {
      if (controller.text.isNotEmpty) {
        return null;
      } else {
        return "$hintTitle must not be empty!";
      }
    },
  );
}
