import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

@freezed
abstract class Either<L, R> with _$Either<L, R> {
  const Either._();

  const factory Either.left(L value) = _Left<L, R>;
  const factory Either.right(R value) = _Right<L, R>;

  /// True si es Right
  bool get isRight => this is _Right<L, R>;

  /// True si es Left
  bool get isLeft => this is _Left<L, R>;

  /// Obtiene Right o null
  R? getRightOrNull() => when(left: (_) => null, right: (r) => r);

  /// Obtiene Left o null
  L? getLeftOrNull() => when(left: (l) => l, right: (_) => null);

  /// Fold clásico (maneja ambos casos)
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight) {
    return when(left: onLeft, right: onRight);
  }

  /// Alias semántico de fold
  T either<T>(T Function(L l) leftFn, T Function(R r) rightFn) =>
      fold(leftFn, rightFn);

  /// Ejecuta efecto secundario SOLO si es Right
  void ifRight(void Function(R value) fn) {
    when(left: (_) {}, right: fn);
  }

  /// Ejecuta efecto secundario SOLO si es Left
  void ifLeft(void Function(L value) fn) {
    when(left: fn, right: (_) {});
  }

  /// Transforma el valor Right
  Either<L, R2> map<R2>(R2 Function(R r) fn) =>
      when(left: (l) => Either.left(l), right: (r) => Either.right(fn(r)));

  /// Transforma el valor Left
  Either<L2, R> mapLeft<L2>(L2 Function(L l) fn) =>
      when(left: (l) => Either.left(fn(l)), right: (r) => Either.right(r));

  /// Encadena operaciones que retornan Either
  Either<L, R2> flatMap<R2>(Either<L, R2> Function(R r) fn) =>
      when(left: (l) => Either.left(l), right: fn);

  /// Obtiene Right o un valor por defecto
  R getOrElse(R Function() orElse) =>
      when(left: (_) => orElse(), right: (r) => r);
}
