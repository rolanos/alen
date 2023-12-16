import 'package:alen/features/articles/view/article_container.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: ListView(
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
      ),
    );
  }
}
