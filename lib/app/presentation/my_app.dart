import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/adaptative_screen/adaptative_screen.dart';
import 'global/router/router_gc.dart';
import 'global/widgets/loader/loader_gw.dart';
import 'router/router_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final adaptativeScreen = AdaptativeScreen(context);
    final RouterGC routerController = routerGP.read();

    routerController.setRouter(routerProvider.read());

    return Stack(
      alignment: Alignment.center,
      children: [
        MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routerProvider.read(),
          title: 'Task App',
          themeMode: ThemeMode.light,
          localizationsDelegates: _getLocalizationsDelegate(),
          supportedLocales: _getSupportedLocales(),
        ),
        LoaderGW(adaptativeScreen: adaptativeScreen),
      ],
    );
  }

  Iterable<LocalizationsDelegate<dynamic>>? _getLocalizationsDelegate() {
    return [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ];
  }

  Iterable<Locale> _getSupportedLocales() {
    return [
      const Locale('en'), // Inglés
      const Locale('es'), // Español
    ];
  }
}
