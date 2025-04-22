// lib/core/utils/directory_util.dart
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DirectoryUtil {
  DirectoryUtil._();

  static Future<Directory> get appDocumentsDir async {
    return await getApplicationDocumentsDirectory();
  }
}
