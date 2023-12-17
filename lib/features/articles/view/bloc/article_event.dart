part of 'article_bloc.dart';

abstract class ArticleEvent {}

class AddArticleEvent extends ArticleEvent {
  final Article article;

  final Completer? completer;

  AddArticleEvent({this.completer, required this.article});
}

class GetAllArticle extends ArticleEvent {}
