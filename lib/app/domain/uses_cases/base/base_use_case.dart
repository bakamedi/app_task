import '../../defs/type_defs.dart';

abstract class UseCase<Output, Params> {
  FutureEither<dynamic, Output> call(Params params);
}

class NoParams {}
