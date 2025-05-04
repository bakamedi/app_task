import 'package:logger/logger.dart';
import 'package:sembast/sembast.dart';

import '../../../../domain/defs/type_defs.dart';
import '../db/db_provider.dart';

class StoreProvider {
  StoreProvider({
    required DbProvider dbProvider,
    required String storeName,
    required Logger logger,
  }) : _dbProvider = dbProvider,
       _storeName = storeName,
       _logger = logger {
    _store = intMapStoreFactory.store(_storeName);
  }

  final DbProvider _dbProvider;
  final String _storeName;
  final Logger _logger;
  late final StoreRef<int, Map<String, Object?>> _store;

  Future<void> createRecord(Json value) async {
    try {
      final key = await _store.add(_dbProvider.db, value);
      _logger.i(
        '[STORE: $_storeName] ✅ createRecord: Record added with key $key.\nData: $value',
      );
    } catch (e, st) {
      _logger.e(
        '[STORE: $_storeName] ❌ createRecord failed.\nData: $value',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<List<RecordSnapshotJson>> getAllRecords({Finder? finder}) async {
    try {
      final records = await _store.find(_dbProvider.db, finder: finder);
      _logger.i(
        '[STORE: $_storeName] ✅ getAllRecords: Found ${records.length} record(s).\nFinder: $finder',
      );
      return records;
    } catch (e, st) {
      _logger.e(
        '[STORE: $_storeName] ❌ getAllRecords failed.\nFinder: $finder',
        error: e,
        stackTrace: st,
      );
      return [];
    }
  }

  Future<bool> updateRecord({required Json value, Finder? finder}) async {
    try {
      final count = await _store.update(_dbProvider.db, value, finder: finder);
      _logger.i(
        '[STORE: $_storeName] ✅ updateRecord: Updated $count record(s).\nData: $value\nFinder: $finder',
      );
      return true;
    } catch (e, st) {
      _logger.e(
        '[STORE: $_storeName] ❌ updateRecord failed.\nData: $value\nFinder: $finder',
        error: e,
        stackTrace: st,
      );
      return false;
    }
  }

  Future<bool> removeRecord({Finder? finder}) async {
    try {
      final count = await _store.delete(_dbProvider.db, finder: finder);
      _logger.i(
        '[STORE: $_storeName] ✅ removeRecord: Removed $count record(s).\nFinder: $finder',
      );
      return true;
    } catch (e, st) {
      _logger.e(
        '[STORE: $_storeName] ❌ removeRecord failed.\nFinder: $finder',
        error: e,
        stackTrace: st,
      );
      return false;
    }
  }
}
