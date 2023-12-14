import 'package:alen/features/core/color_ui.dart';
import 'package:alen/features/core/widget/button_container.dart';
import 'package:alen/features/core/widget/input_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Column(
            children: [
              const SizedBox(
                height: 76.0,
              ),
              InputContainer(
                titleText: 'Login',
                borderRadius: BorderRadius.circular(0),
              ),
              const SizedBox(
                height: 26.0,
              ),
              InputContainer(
                titleText: 'Name',
                borderRadius: BorderRadius.circular(0),
              ),
              const SizedBox(
                height: 26.0,
              ),
              InputContainer(
                titleText: 'Role',
                borderRadius: BorderRadius.circular(0),
              ),
              const SizedBox(
                height: 46.0,
              ),
              ButtonContainer(
                  text: 'Change info',
                  color: ColorsUi.green,
                  onTap: () => context.goNamed('change_info'))
            ],
          ),
        ),
      ),
    );
  }
}
