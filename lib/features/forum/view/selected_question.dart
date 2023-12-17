import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/button_container.dart';
import 'package:alen/features/articles/domain/entity/article.dart';
import 'package:alen/features/forum/domain/entity/question.dart';
import 'package:alen/features/forum/view/bloc/question_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectedQuestion extends StatelessWidget {
  final Question question;

  const SelectedQuestion({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Text(
                    "Question",
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
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: const BoxDecoration(
                    color: ColorsUi.blue,
                  ),
                  child: Text(
                    question.question,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Text(
                    "Answers",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: question.answers.length,
                  itemBuilder: (context, index) => Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 24.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    decoration: const BoxDecoration(
                      color: ColorsUi.blue,
                    ),
                    child: Text(
                      question.answers[index],
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ButtonContainer(
                  text: 'Answer The Question',
                  color: Colors.green,
                  onTap: () {
                    context.goNamed('answer_question', extra: question);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
