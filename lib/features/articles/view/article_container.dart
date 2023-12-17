import 'package:alen/features/articles/domain/entity/article.dart';
import 'package:alen/core/color_ui.dart';
import 'package:alen/features/forum/domain/entity/question.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleContainer extends StatelessWidget {
  final Article? article;
  final Question? question;
  const ArticleContainer({
    super.key,
    this.article,
    this.question,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (article != null) {
          context.goNamed('selected_article', extra: article);
        } else {
          context.goNamed('select_question', extra: question);
        }
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 180),
        decoration: BoxDecoration(
            color: ColorsUi.blue, borderRadius: BorderRadius.circular(45.0)),
        margin: const EdgeInsets.only(
          left: 19.0,
          right: 15.0,
          top: 18.0,
          bottom: 18.0,
        ),
        padding: const EdgeInsets.only(left: 45.0, top: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme: ${(article == null) ? question!.theme : article!.theme}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Description: ${(article == null) ? question!.question : article!.description}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
