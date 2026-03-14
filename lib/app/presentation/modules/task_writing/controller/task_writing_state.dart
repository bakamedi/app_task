import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:signature/signature.dart';

part 'task_writing_state.freezed.dart';

@freezed
abstract class TaskWritingState with _$TaskWritingState {
  const TaskWritingState._();

  const factory TaskWritingState({SignatureController? signatureController}) =
      _TaskWritingState;

  static TaskWritingState get initialState => TaskWritingState(
    signatureController: SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
    ),
  );
}
