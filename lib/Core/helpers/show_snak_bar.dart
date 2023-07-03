import 'package:flutter/material.dart';

showSnakBar(BuildContext context, {required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 10),
    ),
  );
}
