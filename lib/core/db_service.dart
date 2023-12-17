import 'dart:developer';

import 'package:alen/features/articles/data/model/article_api.dart';
import 'package:alen/features/articles/domain/entity/article.dart';
import 'package:alen/features/forum/data/model/question_api.dart';
import 'package:alen/features/forum/domain/entity/question.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseService {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<void> addArticle(Article article) async {
    try {
      final articleId = await ref.child('article_id').get();
      final response = await ref
          .child('articles/${articleId.value as int}')
          .set(ArticleApi.toMap(article));
      await ref.child('article_id').set((articleId.value as int) + 1);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Article>> getAllArticles() async {
    try {
      final response = await ref.child('articles').get();
      if (response.value is Map<String, dynamic>) {
        Map<String, dynamic> buffer = response.value as Map<String, dynamic>;
        return List.generate(
            buffer.length,
            (index) =>
                ArticleApi.fromMap(buffer[index] as Map<String, dynamic>));
      }
      if (response.value is List<dynamic>) {
        List<dynamic> buffer = response.value as List<dynamic>;
        return List.generate(
            buffer.length,
            (index) =>
                ArticleApi.fromMap(buffer[index] as Map<String, dynamic>));
      }
      if (response.value is Map<Object?, Object?>) {
        Map<Object?, Object?> buffered =
            response.value as Map<Object?, Object?>;
        final dynamic buffer = buffered.values.toList();
        return List.generate(
            buffer.length,
            (index) => ArticleApi.fromMap(
                (buffer[index] as Map<Object?, Object?>)
                    .cast<String, dynamic>()));
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<void> addQuestion(Question question) async {
    try {
      final questionId = await ref.child('question_id').get();
      final response =
          await ref.child('questions/${questionId.value as int}').set(
                QuestionApi.toMap(
                  Question(
                    id: questionId.value as int,
                    theme: question.theme,
                    question: question.question,
                    answers: question.answers,
                  ),
                ),
              );
      await ref.child('question_id').set((questionId.value as int) + 1);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Question>> getAllQuestions() async {
    try {
      final response = await ref.child('questions/').get();
      if (response.value is Map<String, dynamic>) {
        Map<String, dynamic> buffer = response.value as Map<String, dynamic>;
        return List.generate(
            buffer.length,
            (index) =>
                QuestionApi.fromMap(buffer[index] as Map<String, dynamic>));
      }
      if (response.value is List<dynamic>) {
        List<dynamic> buffer = response.value as List<dynamic>;
        return List.generate(
            buffer.length,
            (index) =>
                QuestionApi.fromMap(buffer[index] as Map<String, dynamic>));
      }
      if (response.value is Map<Object?, Object?>) {
        Map<Object?, Object?> buffered =
            response.value as Map<Object?, Object?>;
        final dynamic buffer = buffered.values.toList();
        return List.generate(
            buffer.length,
            (index) => QuestionApi.fromMap(
                (buffer[index] as Map<Object?, Object?>)
                    .cast<String, dynamic>()));
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<void> updateAnswer(Question question) async {
    try {
      final response = await ref
          .child('questions/${question.id}')
          .set(QuestionApi.toMap(question));
    } catch (e) {
      log(e.toString());
    }
  }
}
