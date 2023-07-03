import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, required this.icon, required this.hint, this.onChanged});

  IconData icon, eyeIcon = Icons.remove_red_eye;
  String hint;
  bool isShow = false;
  Function(String)? onChanged;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        obscureText: isShow,
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
              color: Theme.of(context).primaryColor,
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
