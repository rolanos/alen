import 'dart:async';

import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/button_container.dart';
import 'package:alen/core/widget/input_container.dart';
import 'package:alen/features/forum/domain/entity/question.dart';
import 'package:alen/features/forum/view/bloc/question_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddAnswerScreen extends StatelessWidget {
  final TextEditingController answerController = TextEditingController();
  final Question question;
  AddAnswerScreen({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsetsDirectional.all(34.0),
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Text(
                    "Answer text",
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
                  height: size.height * 0.25,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  decoration: BoxDecoration(
                    color: ColorsUi.blue,
                    borderRadius: BorderRadius.circular(45.0),
                  ),
                  child: TextFormField(
                    controller: answerController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 34.0,
                ),
                ButtonContainer(
                  text: 'Add The Article',
                  color: ColorsUi.green,
                  onTap: () {
                    Completer completer = Completer();
                    question.answers.add(answerController.text.trim());
                    BlocProvider.of<QuestionBloc>(context).add(
                      UpdateQuestionEvent(
                        completer: completer,
                        question: Question(
                          id: question.id,
                          theme: question.theme,
                          question: question.question,
                          answers: question.answers,
                        ),
                      ),
                    );
                    completer.future.then(
                      (value) {
                        if (context.canPop()) context.pop();
                      },
                    );
                  },
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
