import '../../../either/either.dart';

extension FutureEitherX<L, R> on Future<Either<L, R>> {
  Future<Either<L, R2>> flatMap<R2>(
    Future<Either<L, R2>> Function(R r) fn,
  ) async {
    final result = await this;

    return result.when(left: (l) => Either.left(l), right: (r) => fn(r));
  }
}
