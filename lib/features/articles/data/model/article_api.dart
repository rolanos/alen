import 'package:alen/features/articles/domain/entity/article.dart';

class ArticleApi {
  static Map<String, dynamic> toMap(Article article) {
    return <String, dynamic>{
      'theme': article.theme,
      'description': article.description,
      'text': article.text,
    };
  }

  static Article? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }
    return Article(
      theme: map['theme'] != null ? map['theme'] as String : "",
      description:
          map['description'] != null ? map['description'] as String : "",
      text: map['text'] != null ? map['text'] as String : "",
    );
  }
}
