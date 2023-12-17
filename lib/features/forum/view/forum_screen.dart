import 'package:alen/features/articles/view/article_container.dart';
import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/button_container.dart';
import 'package:alen/features/forum/view/bloc/question_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 17.0),
              child: ButtonContainer(
                text: 'Ask The Question',
                color: ColorsUi.green,
                onTap: () => context.goNamed('ask_question'),
              ),
            ),
            BlocBuilder<QuestionBloc, QuestionState>(
              builder: (context, state) {
                if (state is QuestionInitial) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.questions.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ArticleContainer(
                      article: null,
                      question: state.questions[index],
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
