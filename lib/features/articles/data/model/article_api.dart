import 'package:alen/features/articles/domain/entity/article.dart';

class ArticleApi {
  static Map<String, dynamic> toMap(Article article) {
    return <String, dynamic>{
      'theme': article.theme,
      'description': article.description,
      'text': article.text,
    };
  }

  static Article fromMap(Map<String, dynamic> map) {
    return Article(
      theme: map['theme'] as String,
      description: map['description'] as String,
      text: map['text'] as String,
    );
  }
}
