import 'package:sembast/sembast.dart';

extension FinderExtensions on Finder {
  static Finder byCompleted(bool completed) {
    return Finder(filter: Filter.equals('completed', completed));
  }
}
