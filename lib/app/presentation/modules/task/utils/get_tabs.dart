import 'package:flutter/material.dart';

import '../../../global/l10n_gen/generated/s.dart';

List<Tab> taskTabs(BuildContext context) {
  return [
    Tab(child: Text(AppLocalizations.of(context).all)),
    Tab(child: Text(AppLocalizations.of(context).pending)),
    Tab(child: Text(AppLocalizations.of(context).completed)),
  ];
}
