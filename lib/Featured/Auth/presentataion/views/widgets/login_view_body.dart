import 'package:fire_chat/Core/helpers/show_snak_bar.dart';
import 'package:fire_chat/Featured/Auth/data/models/user_model.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../manager/login_user_cubit/login_user_cubit.dart';
import 'action_row.dart';
import 'app_logo.dart';
import 'login_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool inAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<LoginUserCubit, LoginUserState>(
        listener: (context, state) {
          if (state is LoginUserLoading) {
            setState(() {
              inAsyncCall = true;
            });
          } else if (state is LoginUserFailuer) {
            setState(() {
              inAsyncCall = false;
            });
            showSnakBar(context, text: state.erroeMessage);
          } else if (state is LoginUserSuccess) {
            BlocProvider.of<LoginUserCubit>(context).storeUserToSharedPrefrence(
                UserModel.fromCredintial(state.user));
          } else if (state is StoreUserSuccess) {
            setState(() {
              inAsyncCall = false;
            });
            Navigator.pushReplacementNamed(context, ResetPasswordView.id);
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: inAsyncCall,
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
        ),
      ),
    );
  }
}
