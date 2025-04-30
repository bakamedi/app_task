import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:timeago/timeago.dart' as timeago;

import 'app/presentation/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  timeago.setLocaleMessages('es', timeago.EsMessages());

  runApp(const MyApp());
}
