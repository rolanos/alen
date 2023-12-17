import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/button_container.dart';
import 'package:alen/features/articles/view/article_container.dart';
import 'package:alen/features/articles/view/bloc/article_bloc.dart';
import 'package:alen/features/auth/view/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: SafeArea(
            child: (state is ArticleInitial)
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 32.0, horizontal: 17.0),
                        child: ButtonContainer(
                          text: 'Add The Article',
                          color: ColorsUi.green,
                          onTap: () => context.goNamed('add_article'),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) => ArticleContainer(
                          article: state.articles[index],
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ),
        );
      },
    );
  }
}
