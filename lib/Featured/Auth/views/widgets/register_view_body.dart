import 'package:fire_chat/Featured/Auth/views/login_view.dart';
import 'package:fire_chat/Featured/Auth/views/widgets/register_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'action_row.dart';

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
              onTap: () {
                GoRouter.of(context).push(LoginView.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
