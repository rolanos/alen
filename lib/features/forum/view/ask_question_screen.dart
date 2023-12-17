import 'dart:async';

import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/button_container.dart';
import 'package:alen/core/widget/input_container.dart';
import 'package:alen/features/forum/domain/entity/question.dart';
import 'package:alen/features/forum/view/bloc/question_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AskQuestionScreen extends StatelessWidget {
  final TextEditingController themeController = TextEditingController();
  final TextEditingController questionController = TextEditingController();

  AskQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 34.0, right: 46.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  InputContainer(
                    titleText: 'Theme-text',
                    controller: themeController,
                  ),
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
                      controller: questionController,
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
                      onTap: () {
                        Completer completer = Completer();
                        BlocProvider.of<QuestionBloc>(context).add(
                          AddQuestionsEvent(
                            completer: completer,
                            question: Question(
                              theme: themeController.text.trim(),
                              question: questionController.text.trim(),
                              answers: [],
                            ),
                          ),
                        );
                        completer.future.then((value) => context.go('/forum'));
                      }),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
