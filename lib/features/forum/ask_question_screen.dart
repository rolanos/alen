import 'package:alen/features/core/color_ui.dart';
import 'package:alen/features/core/widget/button_container.dart';
import 'package:alen/features/core/widget/input_container.dart';
import 'package:flutter/material.dart';

class AskQuestionScreen extends StatelessWidget {
  const AskQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 34.0, right: 46.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const InputContainer(titleText: 'Theme-text'),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Text(
                  "Question-text",
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
                height: MediaQuery.of(context).size.height * 0.4,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                decoration: BoxDecoration(
                  color: ColorsUi.blue,
                  borderRadius: BorderRadius.circular(45.0),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Spacer(),
              ButtonContainer(
                  text: 'Ask The Question',
                  color: ColorsUi.green,
                  onTap: () {}),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
