import 'package:sembast/sembast.dart';

extension FinderExtensions on Finder {
  static Finder byOrder() {
    return Finder(sortOrders: [SortOrder('order')]);
  }
}
