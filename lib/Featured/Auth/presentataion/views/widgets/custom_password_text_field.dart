import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomPassWordTextField extends StatefulWidget {
  CustomPassWordTextField(
      {super.key,
      required this.hint,
      this.onSaved,
      this.validator,
      this.onCahange});

  String hint;
  void Function(String?)? onSaved;
  Function(String)? onCahange;
  String? Function(String?)? validator;

  @override
  State<CustomPassWordTextField> createState() =>
      _CustomPassWordTextFieldState();
}

class _CustomPassWordTextFieldState extends State<CustomPassWordTextField> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: widget.validator,
        onSaved: widget.onSaved,
        obscureText: isHide,
        onChanged: widget.onCahange,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 14),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isHide = !isHide;
              });
            },
            icon: Icon(
              !isHide ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.password,
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
