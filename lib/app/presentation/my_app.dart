import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/adaptative_screen/adaptative_screen.dart';
import '../core/l10n/l10n_languages.dart';
import '../core/utils/theme/theme_app.dart';
import 'global/l10n_gen/generated/s.dart';
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
          theme: ThemeApp.lightTheme,
          darkTheme: ThemeApp.darkTheme,
          themeMode: ThemeMode.system,
          localizationsDelegates: _getLocalizationsDelegate(),
          supportedLocales: L10nLanguages.all,
          title: 'Task App',
        ),
        LoaderGW(adaptativeScreen: adaptativeScreen),
      ],
    );
  }

  Iterable<LocalizationsDelegate<dynamic>>? _getLocalizationsDelegate() {
    return [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ];
  }
}
