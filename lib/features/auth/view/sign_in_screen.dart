import 'package:alen/features/auth/view/bloc/auth_bloc.dart';
import 'package:alen/features/auth/view/sing_up_screen.dart';
import 'package:alen/core/widget/input_container.dart';
import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widget/button_container.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go('/profil');
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 40,
                    margin: const EdgeInsets.only(top: 13.0, right: 16.0),
                    padding: const EdgeInsets.only(bottom: 4.0),
                    decoration: const BoxDecoration(
                        color: ColorsUi.red, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        '文',
                        style: textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
                const LogoWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 64,
                      ),
                      InputContainer(
                        titleText: 'Login',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 44,
                      ),
                      InputContainer(
                        titleText: 'Password',
                        controller: passwordController,
                        obscure: true,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      ButtonContainer(
                        text: 'Sign in',
                        color: ColorsUi.green,
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(SignIn(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonContainer(
                        text: 'Register',
                        color: ColorsUi.purple,
                        onTap: () => context.go('/sign_in/sign_up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
