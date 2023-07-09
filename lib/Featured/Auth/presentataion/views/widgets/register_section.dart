import 'package:fire_chat/Core/styles/text_styles.dart';
import 'package:fire_chat/Featured/Auth/presentataion/manager/create_user_cubit/create_user_cubit.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_password_text_field.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key});

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  late String username;
  late String email;
  late String password;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: key,
        child: Column(
          children: [
            const Text(
              'Register Now',
              style: AppTextStyles.s20b,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              icon: Icons.person,
              hint: 'Username',
              onCahange: (p0) {
                username = p0;
              },
              validator: (p0) {
                if (p0?.isEmpty ?? true) {
                  return "Username Can't be empty";
                }
                return null;
              },
            ),
            CustomTextField(
              icon: Icons.email,
              hint: 'Email',
              onCahange: (p0) {
                email = p0;
              },
              validator: (p0) {
                if (p0?.isEmpty ?? true) {
                  return "Email Can't be empty";
                }
                if (!p0!.contains('@')) {
                  return "Error in email formatt";
                }
                return null;
              },
            ),
            CustomPassWordTextField(
              hint: 'Password',
              onCahange: (p0) {
                password = p0;
              },
              validator: (p0) {
                if (p0?.isEmpty ?? true) {
                  return "Password Can't be empty";
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  BlocProvider.of<CreateUserCubit>(context).createUser(
                      userName: username, email: email, passWord: password);
                } else {
                  setState(
                    () {
                      autovalidateMode = AutovalidateMode.always;
                    },
                  );
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
