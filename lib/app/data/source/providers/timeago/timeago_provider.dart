import 'dart:ui' as ui;
import 'package:timeago/timeago.dart' as timeago;

class TimeagoProvider {
  TimeagoProvider();

  void configureTimeAgo() {
    final locale = ui.PlatformDispatcher.instance.locale;
    final languageCode = locale.languageCode;

    switch (languageCode) {
      case 'es':
        timeago.setLocaleMessages('es', timeago.EsMessages());
        break;
      case 'pt':
        timeago.setLocaleMessages('pt', timeago.PtBrMessages());
        break;
      default:
        timeago.setLocaleMessages('en', timeago.EnMessages());
    }
  }
}
