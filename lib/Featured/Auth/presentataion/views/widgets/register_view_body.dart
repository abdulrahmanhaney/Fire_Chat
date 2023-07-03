import 'package:fire_chat/Featured/Auth/presentataion/views/login_view.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/widgets/register_section.dart';
import 'package:flutter/material.dart';

import 'action_row.dart';
import 'app_logo.dart';

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
            const AppLogo(),
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
              onTap: () {
                Navigator.of(context).pushNamed(LoginView.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
