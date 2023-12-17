import 'package:alen/features/articles/domain/entity/article.dart';
import 'package:flutter/material.dart';

class SelectedArticle extends StatelessWidget {
  final Article article;

  const SelectedArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Theme: ${article.theme}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                'Text: ${article.text}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
