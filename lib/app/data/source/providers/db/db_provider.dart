import 'package:path/path.dart';
import 'package:sembast/sembast.dart';

import '../../../../core/utils/directory_util.dart';

class DbProvider {
  DbProvider({required DatabaseFactory databaseFactory})
    : _databaseFactory = databaseFactory;
  final DatabaseFactory _databaseFactory;
  late Database _db;

  Database get db => _db;

  Future<void> connect() async {
    final platformDir = await DirectoryUtil.appDocumentsDir;
    final dbPath = join(platformDir.path, 'my_database.db');
    _db = await _databaseFactory.openDatabase(
      dbPath,
      // codec: SembastCodec(
      //   signature: 'my_codec',
      //   codec: _EncripterCodec(
      //     key: _key,
      //     iv: _iv,
      //   ),
      // ),
    );
  }

  Future<void> close() async {
    await _db.close();
  }
}
