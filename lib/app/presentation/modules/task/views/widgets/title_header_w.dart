import 'package:flutter/material.dart';

import '../../../../global/extensions/widgets_ext.dart';
import '../../../../global/l10n_gen/generated/s.dart';
import '../../../../global/utils/router_util.dart';
import '../../../../global/widgets/titles/title_gw.dart';
import '../../../../router/app_routes/new_task_route.dart';

class TitleHeaderW extends StatelessWidget {
  const TitleHeaderW({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final primaryColor = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [TitleGW(title: AppLocalizations.of(context).title)],
    ).padding(EdgeInsets.only(top: topPadding + 10, left: 16, right: 16));
  }
}
