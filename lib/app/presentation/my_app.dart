import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/l10n/l10n_languages.dart';
import '../core/utils/theme/theme_app.dart';
import 'global/l10n_gen/generated/s.dart';
import 'global/snackbar/app_scaffold_messenger.dart';
import 'global/widgets/loader/loader_gw.dart';
import 'router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        MaterialApp.router(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: AppScaffoldMessenger.messengerKey,
          routerConfig: AppRouter.routerProvider.read(),
          theme: ThemeApp.lightTheme,
          darkTheme: ThemeApp.darkTheme,
          themeMode: ThemeMode.system,
          localizationsDelegates: _getLocalizationsDelegate(),
          supportedLocales: L10nLanguages.all,
          title: 'Task App',
        ),
        LoaderGW(),
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
