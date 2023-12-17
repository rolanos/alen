part of 'question_bloc.dart';

abstract class QuestionState {}

class QuestionInitial extends QuestionState {
  final List<Question> questions;

  QuestionInitial({this.questions = const []});
}

class QuestionError extends QuestionState {}
