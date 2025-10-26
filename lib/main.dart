import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:timeago/timeago.dart' as timeago;

import 'app/core/environment/env_util.dart';
import 'app/core/extensions/flavor_ext.dart';
import 'app/presentation/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvUtil.loadEnv(AppFlavor.development);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  timeago.setLocaleMessages('en', timeago.EnMessages());

  runApp(const MyApp());
}
