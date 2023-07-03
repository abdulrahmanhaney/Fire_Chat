import 'package:fire_chat/Core/styles/text_styles.dart';
import 'package:fire_chat/Featured/Auth/views/widgets/register_section.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: MediaQuery.of(context).size.height * 0.100,
              child: Icon(
                Icons.whatshot_sharp,
                size: 100,
                color: Theme.of(context).cardColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const RegisterSection(),
            const SizedBox(
              height: 15,
            ),
            ActionRow(
              text: 'Already Have An Account ?',
              actionText: 'Login Now',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

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
