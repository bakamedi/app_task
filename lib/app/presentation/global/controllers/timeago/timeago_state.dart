import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeago_state.freezed.dart';

@freezed
abstract class TimeagoState with _$TimeagoState {
  const TimeagoState._();

  const factory TimeagoState() = _TimeagoState;

  static TimeagoState get initialState => const TimeagoState();
}
