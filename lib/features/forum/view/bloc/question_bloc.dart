import 'dart:async';
import 'dart:developer';

import 'package:alen/core/db_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:alen/features/forum/domain/entity/question.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  DataBaseService dataBaseService = DataBaseService();
  QuestionBloc() : super(QuestionInitial()) {
    on<GetAllQuestions>((event, emit) async {
      try {
        List<Question?> articles = await dataBaseService.getAllQuestions();
        emit(QuestionInitial(questions: articles));
      } catch (e) {
        log(e.toString());
        emit(QuestionError());
      }
    });
    on<AddQuestionsEvent>((event, emit) async {
      try {
        await dataBaseService.addQuestion(event.question);
        add(GetAllQuestions());
      } catch (e) {
        log(e.toString());
      }
      event.completer?.complete();
    });
    on<UpdateQuestionEvent>((event, emit) async {
      try {
        await dataBaseService.updateAnswer(event.question);
        add(GetAllQuestions());
      } catch (e) {
        log(e.toString());
      }
      event.completer?.complete();
    });
  }
}
