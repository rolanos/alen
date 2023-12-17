import 'dart:async';

import 'package:alen/features/auth/view/bloc/auth_bloc.dart';
import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/button_container.dart';
import 'package:alen/core/widget/input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangeInfoScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController roleController = TextEditingController();

  ChangeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Column(
            children: [
              const SizedBox(
                height: 95.0,
              ),
              InputContainer(
                titleText: 'Name',
                controller: nameController,
              ),
              const SizedBox(
                height: 24.0,
              ),
              InputContainer(
                titleText: 'Role',
                controller: roleController,
              ),
              const SizedBox(
                height: 40.0,
              ),
              ButtonContainer(
                text: 'Save changes',
                color: ColorsUi.green,
                onTap: () {
                  Completer compl = Completer();
                  BlocProvider.of<AuthBloc>(context).add(
                    UpdateData(
                      completer: compl,
                      name: nameController.text.trim(),
                      role: roleController.text.trim(),
                    ),
                  );
                  compl.future.then((value) => context.go('/profil'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
