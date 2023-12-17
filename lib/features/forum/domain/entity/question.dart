// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Question {
  final int? id;
  final String theme;
  final String question;
  final List<String> answers;

  Question({
    this.id,
    required this.theme,
    required this.question,
    required this.answers,
  });
}
