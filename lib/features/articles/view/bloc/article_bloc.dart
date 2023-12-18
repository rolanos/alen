import 'dart:async';
import 'dart:developer';

import 'package:alen/features/articles/domain/entity/article.dart';
import 'package:alen/core/db_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  DataBaseService dataBaseService = DataBaseService();
  ArticleBloc() : super(ArticleInitial()) {
    on<GetAllArticle>((event, emit) async {
      try {
        List<Article?> articles = await dataBaseService.getAllArticles();
        emit(ArticleInitial(articles: articles));
      } catch (e) {
        log(e.toString());
        emit(ArticleError());
      }
    });
    on<AddArticleEvent>((event, emit) async {
      try {
        await dataBaseService.addArticle(event.article);
        add(GetAllArticle());
      } catch (e) {
        log(e.toString());
      }
      event.completer?.complete();
    });
  }
}
