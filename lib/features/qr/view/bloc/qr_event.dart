part of 'qr_bloc.dart';

abstract class QrEvent {}

class SetQr extends QrEvent {
  final String qr;

  SetQr({required this.qr});
}
