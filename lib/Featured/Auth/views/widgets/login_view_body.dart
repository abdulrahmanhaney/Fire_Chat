import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'action_row.dart';
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
            const LoginSection(),
            const SizedBox(
              height: 15,
            ),
            ActionRow(
              text: "Don't Have An Account ?",
              actionText: 'Register Now',
              onTap: () {
                GoRouter.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
