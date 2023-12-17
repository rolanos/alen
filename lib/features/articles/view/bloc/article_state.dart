part of 'article_bloc.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {
  final List<Article> articles;

  ArticleInitial({this.articles = const []});
}

class ArticleError extends ArticleState {}
