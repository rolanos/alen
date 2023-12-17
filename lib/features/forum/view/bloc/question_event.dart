part of 'question_bloc.dart';

abstract class QuestionEvent {}

class AddQuestionsEvent extends QuestionEvent {
  final Question question;

  final Completer? completer;

  AddQuestionsEvent({this.completer, required this.question});
}

class UpdateQuestionEvent extends QuestionEvent {
  final Question question;

  final Completer? completer;

  UpdateQuestionEvent({this.completer, required this.question});
}

class GetAllQuestions extends QuestionEvent {}
