import 'package:fire_chat/Core/helpers/show_snak_bar.dart';
import 'package:fire_chat/Featured/Auth/presentataion/manager/create_user_cubit/create_user_cubit.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/login_view.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/widgets/register_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'action_row.dart';
import 'app_logo.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  bool isAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<CreateUserCubit, CreateUserState>(
        listener: (context, state) {
          if (state is CreateUserLoading) {
            setState(() {
              isAsyncCall = true;
            });
          } else if (state is CreateUserFailuer) {
            showSnakBar(context, text: state.errorMessage);
            setState(() {
              isAsyncCall = false;
            });
          } else if (state is CreateUserSuccess) {
            debugPrint(state.user.toString());
            setState(() {
              isAsyncCall = false;
            });
            Navigator.pushReplacementNamed(context, LoginView.id);
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: isAsyncCall,
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
        ),
      ),
    );
  }
}
