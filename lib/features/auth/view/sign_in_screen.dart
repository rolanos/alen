import 'package:alen/features/auth/view/sing_up_screen.dart';
import 'package:alen/features/core/widget/input_container.dart';
import 'package:alen/features/core/color_ui.dart';
import 'package:alen/features/core/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widget/button_container.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
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
                    const InputContainer(titleText: 'Login'),
                    const SizedBox(
                      height: 44,
                    ),
                    const InputContainer(titleText: 'Password'),
                    const SizedBox(
                      height: 35,
                    ),
                    ButtonContainer(
                      text: 'Sign in',
                      color: ColorsUi.green,
                      onTap: () => context.go('/profil'),
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
    );
  }
}
