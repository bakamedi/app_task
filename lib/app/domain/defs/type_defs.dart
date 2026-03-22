import 'package:sembast/sembast.dart';

import '../../core/either/either.dart';

typedef RecordSnapshotJson = RecordSnapshot<int, Map<String, Object?>>;
typedef Json = Map<String, dynamic>;
typedef FutureEither<L, R> = Future<Either<L, R>>;
