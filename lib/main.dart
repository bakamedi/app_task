import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app_initializer.dart';
import 'app/presentation/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  AppInitializer.init();

  runApp(const MyApp());
}
