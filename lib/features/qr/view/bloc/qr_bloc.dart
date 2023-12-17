import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrState()) {
    on<SetQr>((event, emit) {
      emit(QrState(qr: event.qr));
    });
  }
}
