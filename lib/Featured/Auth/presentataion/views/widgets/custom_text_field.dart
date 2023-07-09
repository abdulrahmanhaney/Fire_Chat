import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.icon,
      required this.hint,
      this.validator,
      this.onCahange});

  IconData icon, eyeIcon = Icons.remove_red_eye;
  String hint;
  bool isShow = false;
  void Function(String?)? onSaved;
  Function(String)? onCahange;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: validator,
        obscureText: isShow,
        onChanged: onCahange,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Icon(
              icon,
              size: 24,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
