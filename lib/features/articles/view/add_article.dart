import 'dart:async';

import 'package:alen/features/articles/domain/entity/article.dart';
import 'package:alen/features/articles/view/bloc/article_bloc.dart';
import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/button_container.dart';
import 'package:alen/core/widget/input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddArticle extends StatelessWidget {
  final TextEditingController themeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  AddArticle({
    super.key,
  });

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
                Spacer(),
                InputContainer(
                  titleText: 'Theme',
                  controller: themeController,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Text(
                    "Description",
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
                    controller: descriptionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Text(
                    "Text",
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
                  height: size.height * 0.20,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  decoration: BoxDecoration(
                    color: ColorsUi.blue,
                    borderRadius: BorderRadius.circular(45.0),
                  ),
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Spacer(),
                ButtonContainer(
                  text: 'Add The Article',
                  color: ColorsUi.green,
                  onTap: () {
                    Completer completer = Completer();
                    BlocProvider.of<ArticleBloc>(context).add(
                      AddArticleEvent(
                        completer: completer,
                        article: Article(
                          theme: themeController.text.trim(),
                          description: descriptionController.text.trim(),
                          text: textController.text.trimLeft(),
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
