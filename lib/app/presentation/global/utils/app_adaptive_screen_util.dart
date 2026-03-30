import 'package:flutter/material.dart';

import '../../../core/responsive/responsive_screen.dart';
import '../controllers/navigator_key/navigator_key_gc.dart';

class AppAdaptiveScreenUtil {
  static BuildContext get _context =>
      navigatorKeyGC.read().state.navigatorKey!.currentContext!;

  static ResponsiveScreen get _screen => .new(_context);

  static double rw(double px) => _screen.rw(px);

  static double rh(double px) => _screen.rh(px);

  static double rsp(double px) => _screen.rsp(px);

  static double rdg(double px) => _screen.rdg(px);
}
