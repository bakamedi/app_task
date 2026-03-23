import 'package:flutter/material.dart';

import '../../../global/utils/l10n_util.dart';

List<Tab> taskTabs(BuildContext context) {
  return [
    Tab(child: Text(L10nUtil.t.all)),
    Tab(child: Text(L10nUtil.t.pending)),
    Tab(child: Text(L10nUtil.t.completed)),
  ];
}
