import 'package:alen/features/auth/view/sign_in_screen.dart';
import 'package:alen/features/core/widget/logo.dart';
import 'package:flutter/material.dart';

import 'core/color_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignInScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
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
    );
  }
}
