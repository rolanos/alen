import 'package:alen/features/auth/view/bloc/auth_bloc.dart';
import 'package:alen/features/auth/view/sign_in_screen.dart';
import 'package:alen/core/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/color_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthEmpty) {
          context.go('/sign_in');
        }
        if (state is AuthSuccess) {
          context.go('/profil');
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                const LogoWidget(),
                const SizedBox(
                  height: 26.0,
                ),
                RichText(
                  text: TextSpan(
                    text: '2',
                    style: textTheme.titleLarge!.copyWith(
                      color: ColorsUi.red,
                    ),
                    children: [
                      TextSpan(
                        text: '0',
                        style: textTheme.titleLarge!.copyWith(
                          color: ColorsUi.green,
                        ),
                      ),
                      TextSpan(
                        text: '2',
                        style: textTheme.titleLarge!.copyWith(
                          color: ColorsUi.blue,
                        ),
                      ),
                      TextSpan(
                        text: '3',
                        style: textTheme.titleLarge!.copyWith(
                          color: ColorsUi.purple,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
