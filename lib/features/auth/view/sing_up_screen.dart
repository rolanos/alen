import 'package:alen/features/auth/view/sign_in_screen.dart';
import 'package:alen/features/core/color_ui.dart';
import 'package:alen/features/core/widget/logo.dart';
import 'package:flutter/material.dart';

import 'widget/button_container.dart';
import 'widget/input_container.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const InputContainer(titleText: 'Login'),
                    const InputContainer(titleText: 'Password'),
                    const InputContainer(titleText: 'Name'),
                    const InputContainer(titleText: 'Role'),
                    const SizedBox(
                      height: 16,
                    ),
                    ButtonContainer(
                      text: 'Register',
                      color: ColorsUi.green,
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const SingUpScreen())),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      child: ButtonContainer(
                        text: 'Sign in',
                        color: ColorsUi.purple,
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen())),
                      ),
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
