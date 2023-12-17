import 'package:alen/features/forum/domain/entity/question.dart';

class QuestionApi {
  static Map<String, dynamic> toMap(Question question) {
    return <String, dynamic>{
      'id': question.id,
      'theme': question.theme,
      'question': question.question,
      'answers': question.answers,
    };
  }

  static Question fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int,
      theme: map['theme'] as String,
      question: map['question'] as String,
      answers: map['answers'] != null
          ? List<String>.generate((map['answers'] as List<Object?>).length,
              ((index) => (map['answers'] as List<Object?>)[index].toString()))
          : [],
    );
  }
}
