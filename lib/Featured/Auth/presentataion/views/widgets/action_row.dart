import 'package:flutter/material.dart';

import '../../../../../Core/styles/text_styles.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  final String text;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.s14n,
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: AppTextStyles.s14b,
          ),
        ),
      ],
    );
  }
}
