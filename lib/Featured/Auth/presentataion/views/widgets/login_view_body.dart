import 'package:flutter/material.dart';

import 'action_row.dart';
import 'app_logo.dart';
import 'login_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
            const AppLogo(),
            const SizedBox(
              height: 20,
            ),
            const LoginSection(),
            const SizedBox(
              height: 15,
            ),
            ActionRow(
              text: "Don't Have An Account ?",
              actionText: 'Register Now',
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
