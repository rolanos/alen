import 'package:alen/features/auth/view/bloc/auth_bloc.dart';
import 'package:alen/features/auth/view/sign_in_screen.dart';
import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widget/button_container.dart';
import '../../../core/widget/input_container.dart';

class SingUpScreen extends StatefulWidget {
  SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  late final TextEditingController nameController;

  late final TextEditingController roleController;

  List<String> dropDownValues = ["Студент", "Учитель", "Гость"];

  String? dropValue;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      emailController = TextEditingController();
      passwordController = TextEditingController();
      nameController = TextEditingController();
      roleController = TextEditingController();
    }
  }

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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      InputContainer(
                        titleText: 'Login',
                        controller: emailController,
                      ),
                      InputContainer(
                        titleText: 'Password',
                        controller: passwordController,
                        obscure: true,
                      ),
                      InputContainer(
                        titleText: 'Name',
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Text(
                          "Role",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        decoration: BoxDecoration(
                          color: ColorsUi.blue,
                          borderRadius: BorderRadius.circular(45.0),
                        ),
                        child: DropdownButton(
                          value: dropValue,
                          items: List<DropdownMenuItem<String>>.generate(
                            dropDownValues.length,
                            (index) => DropdownMenuItem<String>(
                              value: dropDownValues[index],
                              child: Text(
                                dropDownValues[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              dropValue = val ?? dropDownValues.first;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ButtonContainer(
                        text: 'Register',
                        color: ColorsUi.green,
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignUp(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text.trim(),
                              role: dropValue ?? dropDownValues.first,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        child: ButtonContainer(
                          text: 'Sign in',
                          color: ColorsUi.purple,
                          onTap: () => context.go('/sign_in'),
                        ),
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
