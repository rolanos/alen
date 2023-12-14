import 'package:alen/features/core/color_ui.dart';
import 'package:alen/features/core/widget/button_container.dart';
import 'package:alen/features/core/widget/input_container.dart';
import 'package:flutter/material.dart';

class ChangeInfoScreen extends StatelessWidget {
  const ChangeInfoScreen({super.key});

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
                titleText: 'Login',
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 24.0,
              ),
              InputContainer(
                titleText: 'Password',
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 24.0,
              ),
              InputContainer(
                titleText: 'Name',
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 24.0,
              ),
              InputContainer(
                titleText: 'Role',
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ButtonContainer(
                  text: 'Save changes', color: ColorsUi.green, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
