import 'package:fire_chat/Core/helpers/show_snak_bar.dart';
import 'package:fire_chat/Featured/Auth/presentataion/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../Core/styles/text_styles.dart';
import 'action_row.dart';
import 'app_logo.dart';
import 'custom_text_field.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  bool inAsyncCall = false;
  late String email;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordLoading) {
            setState(() {
              inAsyncCall = true;
            });
          } else if (state is ResetPasswordFailuer) {
            showSnakBar(context, text: state.errorMessage);
            setState(() {
              inAsyncCall = false;
            });
          } else if (state is ResetPasswordSuccess) {
            setState(() {
              inAsyncCall = false;
            });
            showSnakBar(context, text: 'Reset Link Sending With Success');
            Navigator.pop(context);
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: inAsyncCall,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                autovalidateMode: autovalidateMode,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    const AppLogo(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Reset Your Password',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s20b,
                    ),
                    const SizedBox(
                      height: 30,
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
                    ElevatedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          key.currentState!.save();
                          BlocProvider.of<ResetPasswordCubit>(context)
                              .resetPassword(email: email);
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      child: const Text('Reset Password'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ActionRow(
                      text: 'Rememberd Your Password ?',
                      actionText: 'Login Now',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
