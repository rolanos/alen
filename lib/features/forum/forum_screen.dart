import 'package:alen/features/articles/view/article_container.dart';
import 'package:alen/features/core/color_ui.dart';
import 'package:alen/features/core/widget/button_container.dart';
import 'package:flutter/material.dart';
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
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ArticleContainer(),
                ArticleContainer(),
                ArticleContainer(),
                ArticleContainer(),
                ArticleContainer(),
                ArticleContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
